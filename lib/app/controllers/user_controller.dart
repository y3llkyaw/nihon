import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/sub_controllers.dart';

/// Slim orchestrator: handles auth state and delegates to focused sub-controllers.
class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sub-controllers (registered in DI, accessed here for delegation)
  UserProgressController get progress => Get.find<UserProgressController>();
  StreakController get streak => Get.find<StreakController>();
  StarredVocabController get starred => Get.find<StarredVocabController>();

  // ====== Convenience getters (backward compatibility) ======
  RxList<int> get finishedLessons => progress.finishedLessons;
  RxMap<String, List<int>> get finishedChunks => progress.finishedChunks;
  RxInt get currentStreak => streak.currentStreak;
  RxString get lastStudiedDate => streak.lastStudiedDate;
  RxList<String> get studiedDates => streak.studiedDates;
  RxMap<String, List<String>> get starredVocabs => starred.starredVocabs;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        fetchUserData(user.uid);
      } else {
        _clearAll();
      }
    });
  }

  void _clearAll() {
    progress.clearState();
    streak.clearState();
    starred.clearState();
  }

  /// Fetches user data from Firestore and distributes to sub-controllers.
  Future<void> fetchUserData(String uid) async {
    try {
      final userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        final data = userDoc.data()!;
        progress.loadFromData(data);
        streak.loadFromData(data);
        starred.loadFromData(data);
        log("User data fetched for $uid");
      }
    } catch (e) {
      log("Error fetching user data: $e");
    }
  }

  /// Creates a document for a new user or updates last login for existing user.
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
        ...progress.defaultFields,
        ...streak.defaultFields,
        ...starred.defaultFields,
      });
    } else {
      log("User document for ${user.uid} already exists. Updating last login.");
      await userDocRef.update({'lastLogin': FieldValue.serverTimestamp()});
    }
    await fetchUserData(user.uid);
  }

  // ====== Delegated methods (backward compatibility) ======
  Future<void> addFinishedLesson(int lessonIndex) =>
      progress.addFinishedLesson(lessonIndex);

  Future<void> addFinishedChunk(int lessonIndex, int chunkIndex) =>
      progress.addFinishedChunk(lessonIndex, chunkIndex);

  Future<void> updateStreak() => streak.updateStreak();

  Future<void> toggleStarVocab(int lessonIndex, String vocabKey) =>
      starred.toggleStarVocab(lessonIndex, vocabKey);

  bool isVocabStarred(int lessonIndex, String vocabKey) =>
      starred.isVocabStarred(lessonIndex, vocabKey);

  int get totalStarredCount => starred.totalStarredCount;
}
