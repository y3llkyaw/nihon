import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Service for admin operations on Firestore data
class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Admin email list - you can manage this in Firestore later
  static const List<String> adminEmails = [
    // Add your admin email(s) here
    'mgyehtetkyaw@gmail.com', // ← Add your email

    // 'admin@example.com',
  ];

  /// Check if current user is admin
  bool isAdmin() {
    final user = _auth.currentUser;
    if (user == null) return false;

    // Check if user email is in admin list
    return adminEmails.contains(user.email);
  }

  /// Get all vocabulary lessons
  Future<List<Map<String, dynamic>>> getAllLessons() async {
    try {
      final snapshot = await _firestore
          .collection('vocabulary_lessons')
          .orderBy('lesson_number')
          .get();

      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'lesson_number': doc.data()['lesson_number'],
          'vocabulary': doc.data()['vocabulary'],
        };
      }).toList();
    } catch (e) {
      print('❌ Error fetching lessons: $e');
      rethrow;
    }
  }

  /// Get single lesson by ID
  Future<Map<String, dynamic>> getLesson(String lessonId) async {
    try {
      final doc =
          await _firestore.collection('vocabulary_lessons').doc(lessonId).get();

      if (!doc.exists) {
        throw Exception('Lesson not found');
      }

      return {
        'id': doc.id,
        'lesson_number': doc.data()!['lesson_number'],
        'vocabulary': doc.data()!['vocabulary'],
      };
    } catch (e) {
      print('❌ Error fetching lesson: $e');
      rethrow;
    }
  }

  /// Update lesson vocabulary
  Future<void> updateLesson(
      String lessonId, Map<String, dynamic> vocabulary) async {
    try {
      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': vocabulary,
      });
      print('✅ Lesson updated successfully');
    } catch (e) {
      print('❌ Error updating lesson: $e');
      rethrow;
    }
  }

  /// Add vocabulary item to lesson
  Future<void> addVocabularyItem(
    String lessonId,
    String burmese,
    List<dynamic> details,
  ) async {
    try {
      final doc =
          await _firestore.collection('vocabulary_lessons').doc(lessonId).get();

      if (!doc.exists) {
        throw Exception('Lesson not found');
      }

      final vocabulary = Map<String, dynamic>.from(doc.data()!['vocabulary']);
      vocabulary[burmese] = details;

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': vocabulary,
      });

      print('✅ Vocabulary item added successfully');
    } catch (e) {
      print('❌ Error adding vocabulary item: $e');
      rethrow;
    }
  }

  /// Delete vocabulary item from lesson
  Future<void> deleteVocabularyItem(String lessonId, String burmese) async {
    try {
      final doc =
          await _firestore.collection('vocabulary_lessons').doc(lessonId).get();

      if (!doc.exists) {
        throw Exception('Lesson not found');
      }

      final vocabulary = Map<String, dynamic>.from(doc.data()!['vocabulary']);
      vocabulary.remove(burmese);

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': vocabulary,
      });

      print('✅ Vocabulary item deleted successfully');
    } catch (e) {
      print('❌ Error deleting vocabulary item: $e');
      rethrow;
    }
  }

  /// Update vocabulary item in lesson
  Future<void> updateVocabularyItem(
    String lessonId,
    String oldBurmese,
    String newBurmese,
    List<dynamic> details,
  ) async {
    try {
      final doc =
          await _firestore.collection('vocabulary_lessons').doc(lessonId).get();

      if (!doc.exists) {
        throw Exception('Lesson not found');
      }

      final vocabulary = Map<String, dynamic>.from(doc.data()!['vocabulary']);

      // Remove old key if burmese changed
      if (oldBurmese != newBurmese) {
        vocabulary.remove(oldBurmese);
      }

      // Add/update with new data
      vocabulary[newBurmese] = details;

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': vocabulary,
      });

      print('✅ Vocabulary item updated successfully');
    } catch (e) {
      print('❌ Error updating vocabulary item: $e');
      rethrow;
    }
  }

  /// Create new lesson
  Future<void> createLesson(
      int lessonNumber, Map<String, dynamic> vocabulary) async {
    try {
      await _firestore
          .collection('vocabulary_lessons')
          .doc('lesson_$lessonNumber')
          .set({
        'lesson_number': lessonNumber,
        'vocabulary': vocabulary,
      });
      print('✅ Lesson created successfully');
    } catch (e) {
      print('❌ Error creating lesson: $e');
      rethrow;
    }
  }

  /// Delete lesson
  Future<void> deleteLesson(String lessonId) async {
    try {
      await _firestore.collection('vocabulary_lessons').doc(lessonId).delete();
      print('✅ Lesson deleted successfully');
    } catch (e) {
      print('❌ Error deleting lesson: $e');
      rethrow;
    }
  }
}
