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
        final rawVocab = doc.data()['vocabulary'];
        final orderedMap = <String, dynamic>{};
        if (rawVocab is List) {
          for (var item in rawVocab) {
            if (item is Map) {
              orderedMap[item['key'] as String] = item['value'];
            }
          }
        } else if (rawVocab is Map) {
          orderedMap.addAll(Map<String, dynamic>.from(rawVocab));
        }

        return {
          'id': doc.id,
          'lesson_number': doc.data()['lesson_number'],
          'vocabulary': orderedMap,
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

      final rawVocab = doc.data()!['vocabulary'];
      final orderedMap = <String, dynamic>{};
      if (rawVocab is List) {
        for (var item in rawVocab) {
          if (item is Map) {
            orderedMap[item['key'] as String] = item['value'];
          }
        }
      } else if (rawVocab is Map) {
        orderedMap.addAll(Map<String, dynamic>.from(rawVocab));
      }

      return {
        'id': doc.id,
        'lesson_number': doc.data()!['lesson_number'],
        'vocabulary': orderedMap,
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
      // Convert map to ordered list
      final orderedList = vocabulary.entries
          .map((e) => {
                'key': e.key,
                'value': e.value,
              })
          .toList();

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': orderedList,
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

      final rawVocab = doc.data()!['vocabulary'];
      List<Map<String, dynamic>> orderedList = [];

      if (rawVocab is List) {
        for (var item in rawVocab) {
          if (item is Map) {
            if (item['key'] != burmese) {
              orderedList.add({
                'key': item['key'],
                'value': item['value'],
              });
            }
          }
        }
        orderedList.add({
          'key': burmese,
          'value': details,
        });
      } else if (rawVocab is Map) {
        for (var entry in rawVocab.entries) {
          if (entry.key != burmese) {
            orderedList.add({
              'key': entry.key,
              'value': entry.value,
            });
          }
        }
        orderedList.add({
          'key': burmese,
          'value': details,
        });
      }

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': orderedList,
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

      final rawVocab = doc.data()!['vocabulary'];
      List<Map<String, dynamic>> orderedList = [];

      if (rawVocab is List) {
        for (var item in rawVocab) {
          if (item is Map) {
            if (item['key'] != burmese) {
              orderedList.add({
                'key': item['key'],
                'value': item['value'],
              });
            }
          }
        }
      } else if (rawVocab is Map) {
        for (var entry in rawVocab.entries) {
          if (entry.key != burmese) {
            orderedList.add({
              'key': entry.key,
              'value': entry.value,
            });
          }
        }
      }

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': orderedList,
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

      final rawVocab = doc.data()!['vocabulary'];
      List<Map<String, dynamic>> orderedList = [];

      if (rawVocab is List) {
        bool updated = false;
        for (var item in rawVocab) {
          if (item is Map) {
            if (item['key'] == oldBurmese) {
              orderedList.add({
                'key': newBurmese,
                'value': details,
              });
              updated = true;
            } else {
              orderedList.add({
                'key': item['key'],
                'value': item['value'],
              });
            }
          }
        }
        if (!updated) {
          orderedList.add({
            'key': newBurmese,
            'value': details,
          });
        }
      } else if (rawVocab is Map) {
        bool updated = false;
        for (var entry in rawVocab.entries) {
          if (entry.key == oldBurmese) {
            orderedList.add({
              'key': newBurmese,
              'value': details,
            });
            updated = true;
          } else {
            orderedList.add({
              'key': entry.key,
              'value': entry.value,
            });
          }
        }
        if (!updated) {
          orderedList.add({
            'key': newBurmese,
            'value': details,
          });
        }
      }

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': orderedList,
      });

      print('✅ Vocabulary item updated successfully');
    } catch (e) {
      print('❌ Error updating vocabulary item: $e');
      rethrow;
    }
  }

  /// Reorder vocabulary item in lesson
  Future<void> reorderVocabularyItem(
    String lessonId,
    int oldIndex,
    int newIndex,
  ) async {
    try {
      final doc =
          await _firestore.collection('vocabulary_lessons').doc(lessonId).get();

      if (!doc.exists) {
        throw Exception('Lesson not found');
      }

      final rawVocab = doc.data()!['vocabulary'];
      List<Map<String, dynamic>> orderedList = [];

      if (rawVocab is List) {
        for (var item in rawVocab) {
          if (item is Map) {
            orderedList.add({
              'key': item['key'],
              'value': item['value'],
            });
          }
        }
      } else if (rawVocab is Map) {
        for (var entry in rawVocab.entries) {
          orderedList.add({
            'key': entry.key,
            'value': entry.value,
          });
        }
      }

      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = orderedList.removeAt(oldIndex);
      orderedList.insert(newIndex, item);

      await _firestore.collection('vocabulary_lessons').doc(lessonId).update({
        'vocabulary': orderedList,
      });

      print('✅ Vocabulary item reordered successfully');
    } catch (e) {
      print('❌ Error reordering vocabulary item: $e');
      rethrow;
    }
  }

  /// Create new lesson
  Future<void> createLesson(
      int lessonNumber, Map<String, dynamic> vocabulary) async {
    try {
      final orderedList = vocabulary.entries
          .map((e) => {
                'key': e.key,
                'value': e.value,
              })
          .toList();

      await _firestore
          .collection('vocabulary_lessons')
          .doc('lesson_$lessonNumber')
          .set({
        'lesson_number': lessonNumber,
        'vocabulary': orderedList,
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
