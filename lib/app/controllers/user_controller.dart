import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable properties to hold user progress data for reactive UI updates.
  final RxList<int> finishedLessons = <int>[].obs;
  final RxMap<String, List<int>> finishedChunks = <String, List<int>>{}.obs;

  // Streak related state
  final RxInt currentStreak = 0.obs;
  final RxString lastStudiedDate = ''.obs;
  final RxList<String> studiedDates = <String>[].obs;

  // Starred vocabulary state: lessonIndex (string) -> list of vocab keys
  final RxMap<String, List<String>> starredVocabs =
      <String, List<String>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to authentication state changes.
    // When a user logs in, fetch their data. When they log out, clear it.
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        fetchUserData(user.uid);
      } else {
        finishedLessons.clear();
        finishedChunks.clear();
        currentStreak.value = 0;
        lastStudiedDate.value = '';
        studiedDates.clear();
        starredVocabs.clear();
      }
    });
  }

  /// Fetches user data from Firestore and populates the local observable properties.
  Future<void> fetchUserData(String uid) async {
    try {
      final userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        final data = userDoc.data()!;

        if (data['finishedLessons'] is List) {
          finishedLessons.value = List<int>.from(data['finishedLessons']);
        }

        if (data['finishedChunks'] is Map) {
          final chunksData = Map<String, dynamic>.from(data['finishedChunks']);
          finishedChunks.value = chunksData.map(
            (key, value) => MapEntry(key, List<int>.from(value)),
          );
        }

        if (data['currentStreak'] is int) {
          currentStreak.value = data['currentStreak'];
        }

        if (data['lastStudiedDate'] is String) {
          lastStudiedDate.value = data['lastStudiedDate'];
        }

        if (data['studiedDates'] is List) {
          studiedDates.value = List<String>.from(data['studiedDates']);
        }

        if (data['starredVocabs'] is Map) {
          final starred = Map<String, dynamic>.from(data['starredVocabs']);
          starredVocabs.value = starred.map(
            (key, value) => MapEntry(key, List<String>.from(value)),
          );
        }
        log("User data fetched for $uid");
      }
    } catch (e) {
      log("Error fetching user data: $e");
    }
  }

  /// Creates a document for a new user in the 'users' collection or updates
  /// the last login time for an existing user.
  Future<void> createUserDocument(User user) async {
    final userDocRef = _firestore.collection('users').doc(user.uid);
    final userDoc = await userDocRef.get();

    if (!userDoc.exists) {
      log("Creating new user document for ${user.uid}");
      await userDocRef.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'createdAt': FieldValue.serverTimestamp(),
        'lastLogin': FieldValue.serverTimestamp(),
        'finishedLessons': [],
        'finishedChunks': {},
        'currentStreak': 0,
        'lastStudiedDate': '',
        'studiedDates': [],
        'starredVocabs': {},
      });
    } else {
      log("User document for ${user.uid} already exists. Updating last login.");
      await userDocRef.update({'lastLogin': FieldValue.serverTimestamp()});
    }
    // Fetch data after creation or login to ensure local state is up-to-date.
    await fetchUserData(user.uid);
  }

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

    await updateStreak();
  }

  /// Adds a chunk index to a specific lesson in the user's finished chunks map.
  Future<void> addFinishedChunk(int lessonIndex, int chunkIndex) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final userDocRef = _firestore.collection('users').doc(user.uid);
    final lessonKey = lessonIndex.toString();

    // Use dot notation to atomically add an element to an array within a map.
    await userDocRef.update({
      'finishedChunks.$lessonKey': FieldValue.arrayUnion([chunkIndex])
    });

    await updateStreak();
  }

  /// Updates the user's running streak based on today's date
  Future<void> updateStreak() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final now = DateTime.now();
    // Use local time, format YYYY-MM-DD
    final todayStr =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    if (lastStudiedDate.value == todayStr) {
      // Already studied today
      return;
    }

    int newStreak = currentStreak.value;

    if (lastStudiedDate.value.isNotEmpty) {
      final lastDate = DateTime.tryParse(lastStudiedDate.value);
      if (lastDate != null) {
        final yesterday = DateTime(now.year, now.month, now.day)
            .subtract(const Duration(days: 1));
        final lastZeroTime =
            DateTime(lastDate.year, lastDate.month, lastDate.day);

        if (lastZeroTime.isAtSameMomentAs(yesterday)) {
          // Studied yesterday, increment streak
          newStreak += 1;
        } else if (lastZeroTime.isBefore(yesterday)) {
          // Streak broken
          newStreak = 1;
        } else {
          // Defensive: last studied date is in the future somehow
          newStreak = 1;
        }
      } else {
        newStreak = 1;
      }
    } else {
      // First time studying
      newStreak = 1;
    }

    final updatedDates = List<String>.from(studiedDates);
    if (!updatedDates.contains(todayStr)) {
      updatedDates.add(todayStr);
    }

    final userDocRef = _firestore.collection('users').doc(user.uid);
    await userDocRef.update({
      'currentStreak': newStreak,
      'lastStudiedDate': todayStr,
      'studiedDates': FieldValue.arrayUnion([todayStr]),
    });

    // Update local state
    currentStreak.value = newStreak;
    lastStudiedDate.value = todayStr;
    if (!studiedDates.contains(todayStr)) {
      studiedDates.add(todayStr);
    }
  }

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

    // Update local state immediately for responsive UI
    starredVocabs[lessonKey] = currentList;
    starredVocabs.refresh();

    // Persist to Firestore
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
