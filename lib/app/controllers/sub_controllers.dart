import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// Manages lesson and chunk progress tracking.
class UserProgressController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<int> finishedLessons = <int>[].obs;
  final RxMap<String, List<int>> finishedChunks = <String, List<int>>{}.obs;

  /// Populates state from a Firestore user document snapshot.
  void loadFromData(Map<String, dynamic> data) {
    if (data['finishedLessons'] is List) {
      finishedLessons.value = List<int>.from(data['finishedLessons']);
    }
    if (data['finishedChunks'] is Map) {
      final chunksData = Map<String, dynamic>.from(data['finishedChunks']);
      finishedChunks.value = chunksData.map(
        (key, value) => MapEntry(key, List<int>.from(value)),
      );
    }
  }

  /// Clears all local state (e.g. on logout).
  void clearState() {
    finishedLessons.clear();
    finishedChunks.clear();
  }

  /// Returns the default Firestore fields for a new user document.
  Map<String, dynamic> get defaultFields => {
        'finishedLessons': [],
        'finishedChunks': {},
      };

  /// Adds a lesson index to the user's list of finished lessons.
  Future<void> addFinishedLesson(int lessonIndex) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final userDocRef = _firestore.collection('users').doc(user.uid);
    await userDocRef.update({
      'finishedLessons': FieldValue.arrayUnion([lessonIndex]),
    });
    if (!finishedLessons.contains(lessonIndex)) {
      finishedLessons.add(lessonIndex);
    }

    // Trigger streak update
    final streakController = Get.find<StreakController>();
    await streakController.updateStreak();
  }

  /// Adds a chunk index to a specific lesson in the user's finished chunks map.
  Future<void> addFinishedChunk(int lessonIndex, int chunkIndex) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final userDocRef = _firestore.collection('users').doc(user.uid);
    final lessonKey = lessonIndex.toString();

    await userDocRef.update({
      'finishedChunks.$lessonKey': FieldValue.arrayUnion([chunkIndex])
    });

    // Trigger streak update
    final streakController = Get.find<StreakController>();
    await streakController.updateStreak();
  }
}

/// Manages daily study streak tracking.
class StreakController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxInt currentStreak = 0.obs;
  final RxString lastStudiedDate = ''.obs;
  final RxList<String> studiedDates = <String>[].obs;

  /// Populates state from a Firestore user document snapshot.
  void loadFromData(Map<String, dynamic> data) {
    if (data['currentStreak'] is int) {
      currentStreak.value = data['currentStreak'];
    }
    if (data['lastStudiedDate'] is String) {
      lastStudiedDate.value = data['lastStudiedDate'];
    }
    if (data['studiedDates'] is List) {
      studiedDates.value = List<String>.from(data['studiedDates']);
    }
  }

  /// Clears all local state (e.g. on logout).
  void clearState() {
    currentStreak.value = 0;
    lastStudiedDate.value = '';
    studiedDates.clear();
  }

  /// Returns the default Firestore fields for a new user document.
  Map<String, dynamic> get defaultFields => {
        'currentStreak': 0,
        'lastStudiedDate': '',
        'studiedDates': [],
      };

  /// Updates the user's running streak based on today's date.
  Future<void> updateStreak() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final now = DateTime.now();
    final todayStr =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    if (lastStudiedDate.value == todayStr) return;

    int newStreak = currentStreak.value;

    if (lastStudiedDate.value.isNotEmpty) {
      final lastDate = DateTime.tryParse(lastStudiedDate.value);
      if (lastDate != null) {
        final yesterday = DateTime(now.year, now.month, now.day)
            .subtract(const Duration(days: 1));
        final lastZeroTime =
            DateTime(lastDate.year, lastDate.month, lastDate.day);

        if (lastZeroTime.isAtSameMomentAs(yesterday)) {
          newStreak += 1;
        } else {
          newStreak = 1;
        }
      } else {
        newStreak = 1;
      }
    } else {
      newStreak = 1;
    }

    final userDocRef = _firestore.collection('users').doc(user.uid);
    await userDocRef.update({
      'currentStreak': newStreak,
      'lastStudiedDate': todayStr,
      'studiedDates': FieldValue.arrayUnion([todayStr]),
    });

    currentStreak.value = newStreak;
    lastStudiedDate.value = todayStr;
    if (!studiedDates.contains(todayStr)) {
      studiedDates.add(todayStr);
    }
  }
}

/// Manages starred/favorite vocabulary items.
class StarredVocabController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Maps lesson index (string) -> list of starred vocab keys.
  final RxMap<String, List<String>> starredVocabs =
      <String, List<String>>{}.obs;

  /// Populates state from a Firestore user document snapshot.
  void loadFromData(Map<String, dynamic> data) {
    if (data['starredVocabs'] is Map) {
      final starred = Map<String, dynamic>.from(data['starredVocabs']);
      starredVocabs.value = starred.map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      );
    }
  }

  /// Clears all local state (e.g. on logout).
  void clearState() {
    starredVocabs.clear();
  }

  /// Returns the default Firestore fields for a new user document.
  Map<String, dynamic> get defaultFields => {
        'starredVocabs': {},
      };

  /// Toggles the starred state of a vocab item for a given lesson.
  Future<void> toggleStarVocab(int lessonIndex, String vocabKey) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final lessonKey = lessonIndex.toString();
    final currentList = List<String>.from(starredVocabs[lessonKey] ?? []);

    if (currentList.contains(vocabKey)) {
      currentList.remove(vocabKey);
    } else {
      currentList.add(vocabKey);
    }

    starredVocabs[lessonKey] = currentList;
    starredVocabs.refresh();

    final userDocRef = _firestore.collection('users').doc(user.uid);
    await userDocRef.update({
      'starredVocabs.$lessonKey': currentList,
    });
  }

  /// Returns whether a vocab item is starred for a given lesson.
  bool isVocabStarred(int lessonIndex, String vocabKey) {
    final lessonKey = lessonIndex.toString();
    return starredVocabs[lessonKey]?.contains(vocabKey) ?? false;
  }

  /// Returns the total count of starred vocab items across all lessons.
  int get totalStarredCount {
    int count = 0;
    for (final list in starredVocabs.values) {
      count += list.length;
    }
    return count;
  }
}
