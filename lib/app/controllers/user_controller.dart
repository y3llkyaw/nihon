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
  }
}
