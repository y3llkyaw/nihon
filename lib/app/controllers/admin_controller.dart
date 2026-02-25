import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/data/services/admin_service.dart';

/// Controller for admin panel operations
class AdminController extends GetxController {
  final AdminService _adminService = AdminService();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Map<String, dynamic>> lessons = <Map<String, dynamic>>[].obs;
  final Rx<Map<String, dynamic>?> selectedLesson =
      Rx<Map<String, dynamic>?>(null);

  /// Check if current user is admin
  bool isAdmin() => _adminService.isAdmin();

  /// Refresh the repository cache so lessons show updated data immediately
  Future<void> _refreshCache() async {
    try {
      if (Get.isRegistered<JapaneseDataRepository>()) {
        final repo = Get.find<JapaneseDataRepository>();
        await repo.getVocabularyLessons(forceRefresh: true);
      }
    } catch (e) {
      print('❌ Failed to refresh repository cache: $e');
    }
  }

  /// Load all lessons
  Future<void> loadLessons() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      lessons.value = await _adminService.getAllLessons();

      print('✅ Loaded ${lessons.length} lessons');
    } catch (e) {
      errorMessage.value = 'Failed to load lessons: $e';
      print('❌ rror loading lessons: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Load single lesson
  Future<void> loadLesson(String lessonId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      selectedLesson.value = await _adminService.getLesson(lessonId);

      print('✅ Loaded lesson: $lessonId');
    } catch (e) {
      errorMessage.value = 'Failed to load lesson: $e';
      print('❌ Error loading lesson: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Update lesson vocabulary
  Future<bool> updateLesson(
      String lessonId, Map<String, dynamic> vocabulary) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.updateLesson(lessonId, vocabulary);

      // Reload lessons to reflect changes
      await loadLessons();
      await _refreshCache();

      Get.snackbar(
        'Success',
        'Lesson updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to update lesson: $e';
      Get.snackbar(
        'Error',
        'Failed to update lesson: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Add vocabulary item to lesson
  Future<bool> addVocabularyItem(
    String lessonId,
    String burmese,
    List<dynamic> details,
  ) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.addVocabularyItem(lessonId, burmese, details);

      // Reload the lesson to get updated data
      await loadLesson(lessonId);
      await _refreshCache();

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to add vocabulary: $e';
      log('❌ Error adding vocabulary: $e');

      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete vocabulary item from lesson
  Future<bool> deleteVocabularyItem(String lessonId, String burmese) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.deleteVocabularyItem(lessonId, burmese);

      // Reload the lesson to get updated data
      await loadLesson(lessonId);
      await _refreshCache();

      Get.snackbar(
        'Success',
        'Vocabulary item deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to delete vocabulary: $e';
      print('❌ Error deleting vocabulary: $e');

      Get.snackbar(
        'Error',
        'Failed to delete vocabulary item',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Update vocabulary item in lesson
  Future<bool> updateVocabularyItem(
    String lessonId,
    String oldBurmese,
    String newBurmese,
    List<dynamic> details,
  ) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.updateVocabularyItem(
        lessonId,
        oldBurmese,
        newBurmese,
        details,
      );

      // Reload selected lesson to reflect changes
      await loadLesson(lessonId);
      await _refreshCache();

      Get.snackbar(
        'Success',
        'Vocabulary item updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to update vocabulary: $e';
      print('❌ Error updating vocabulary: $e');

      Get.snackbar(
        'Error',
        'Failed to update vocabulary item',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Reorder vocabulary item in lesson
  Future<bool> reorderVocabularyItem(
    String lessonId,
    int oldIndex,
    int newIndex,
  ) async {
    try {
      errorMessage.value = '';

      // Optimistic UI update
      if (selectedLesson.value != null) {
        final currentLesson = Map<String, dynamic>.from(selectedLesson.value!);
        final vocabulary = currentLesson['vocabulary'] as Map<String, dynamic>;
        final entries = vocabulary.entries.toList();

        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = entries.removeAt(oldIndex);
        entries.insert(newIndex, item);

        // Rebuild the map keeping the new order
        final newVocabMap = <String, dynamic>{};
        for (var entry in entries) {
          newVocabMap[entry.key] = entry.value;
        }
        currentLesson['vocabulary'] = newVocabMap;
        selectedLesson.value = currentLesson;
      }

      await _adminService.reorderVocabularyItem(lessonId, oldIndex, newIndex);

      // Refresh cache for user side
      await _refreshCache();

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to reorder vocabulary: $e';
      print('❌ Error reordering vocabulary: $e');

      // Revert optimistic update by reloading from server
      await loadLesson(lessonId);

      Get.snackbar(
        'Error',
        'Failed to reorder vocabulary item',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    }
  }

  /// Create new lesson
  Future<bool> createLesson(
      int lessonNumber, Map<String, dynamic> vocabulary) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.createLesson(lessonNumber, vocabulary);

      // Reload lessons to reflect changes
      await loadLessons();
      await _refreshCache();

      Get.snackbar(
        'Success',
        'Lesson created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to create lesson: $e';
      Get.snackbar(
        'Error',
        'Failed to create lesson: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete lesson
  Future<bool> deleteLesson(String lessonId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _adminService.deleteLesson(lessonId);

      // Reload lessons to reflect changes
      await loadLessons();
      await _refreshCache();

      Get.snackbar(
        'Success',
        'Lesson deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      return true;
    } catch (e) {
      errorMessage.value = 'Failed to delete lesson: $e';
      Get.snackbar(
        'Error',
        'Failed to delete lesson: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
