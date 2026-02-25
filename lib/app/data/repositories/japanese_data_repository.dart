import 'dart:developer';

import 'package:get/get.dart';
import 'package:hiragana/app/data/services/firebase_data_service.dart';

/// Repository to manage Japanese learning data with loading/error states
/// Abstracts the data source (Firebase + cache) from the UI layer
class JapaneseDataRepository {
  final FirebaseDataService _firebaseService = FirebaseDataService();

  // Observable states
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // In-memory cache
  List<Map<String, dynamic>>? _hiraganaTable;
  List<Map<String, dynamic>>? _katakanaTable;
  Map<String, String>? _hiraganaMap;
  Map<String, String>? _katakanaMap;
  List<Map<String, dynamic>>? _vocabularyLessons;

  /// Initialize data - call this on app startup
  /// Will load from cache if available, otherwise from Firebase
  Future<void> initialize() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Check if cache exists
      if (_firebaseService.hasCachedData()) {
        log('📦 Loading data from cache...');
        // Load all data from cache (will be fast)
        await Future.wait([
          getHiraganaTable(),
          getKatakanaTable(),
          getVocabularyLessons(),
        ]);
      } else {
        log('🌐 No cache found, fetching from Firebase...');
        // First time - fetch from Firebase
        await Future.wait([
          getHiraganaTable(forceRefresh: true),
          getKatakanaTable(forceRefresh: true),
          getVocabularyLessons(forceRefresh: true),
        ]);
      }

      log('✅ Data repository initialized successfully');
    } catch (e) {
      errorMessage.value = 'Failed to initialize data: $e';
      log('❌ Error initializing data repository: $e');
      // Don't rethrow - let app continue with what's in cache
    } finally {
      isLoading.value = false;
    }
  }

  /// Get hiragana table
  Future<List<Map<String, dynamic>>> getHiraganaTable({
    bool forceRefresh = false,
  }) async {
    if (_hiraganaTable != null && !forceRefresh) {
      return _hiraganaTable!;
    }

    _hiraganaTable = await _firebaseService.getHiraganaTable(
      forceRefresh: forceRefresh,
    );
    return _hiraganaTable!;
  }

  /// Get katakana table
  Future<List<Map<String, dynamic>>> getKatakanaTable({
    bool forceRefresh = false,
  }) async {
    if (_katakanaTable != null && !forceRefresh) {
      return _katakanaTable!;
    }

    _katakanaTable = await _firebaseService.getKatakanaTable(
      forceRefresh: forceRefresh,
    );
    return _katakanaTable!;
  }

  /// Get hiragana character map
  Future<Map<String, String>> getHiraganaMap({
    bool forceRefresh = false,
  }) async {
    if (_hiraganaMap != null && !forceRefresh) {
      return _hiraganaMap!;
    }

    _hiraganaMap = await _firebaseService.getHiraganaMap(
      forceRefresh: forceRefresh,
    );
    return _hiraganaMap!;
  }

  /// Get katakana character map
  Future<Map<String, String>> getKatakanaMap({
    bool forceRefresh = false,
  }) async {
    if (_katakanaMap != null && !forceRefresh) {
      return _katakanaMap!;
    }

    _katakanaMap = await _firebaseService.getKatakanaMap(
      forceRefresh: forceRefresh,
    );
    return _katakanaMap!;
  }

  /// Get vocabulary lessons
  Future<List<Map<String, dynamic>>> getVocabularyLessons({
    bool forceRefresh = false,
  }) async {
    if (_vocabularyLessons != null && !forceRefresh) {
      return _vocabularyLessons!;
    }

    _vocabularyLessons = await _firebaseService.getVocabularyLessons(
      forceRefresh: forceRefresh,
    );
    return _vocabularyLessons!;
  }

  /// Get a single vocabulary lesson by index (0-based)
  Future<Map<String, dynamic>> getVocabularyLesson(int lessonIndex) async {
    final lessons = await getVocabularyLessons();

    if (lessonIndex < 0 || lessonIndex >= lessons.length) {
      throw Exception(
          'Lesson index $lessonIndex out of range (0-${lessons.length - 1})');
    }

    return lessons[lessonIndex];
  }

  /// Get combined character map (hiragana + katakana)
  Future<Map<String, String>> getCharacterMap({
    bool forceRefresh = false,
  }) async {
    final hiragana = await getHiraganaMap(forceRefresh: forceRefresh);
    final katakana = await getKatakanaMap(forceRefresh: forceRefresh);
    return {...hiragana, ...katakana};
  }

  /// Clear all cached data and in-memory cache
  Future<void> clearCache() async {
    await _firebaseService.clearCache();
    _hiraganaTable = null;
    _katakanaTable = null;
    _hiraganaMap = null;
    _katakanaMap = null;
    _vocabularyLessons = null;
    log('🗑️ Repository cache cleared');
  }

  /// Refresh all data from Firebase
  Future<void> refreshAll() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await Future.wait([
        getHiraganaTable(forceRefresh: true),
        getKatakanaTable(forceRefresh: true),
        getVocabularyLessons(forceRefresh: true),
      ]);

      log('✅ All data refreshed from Firebase');
    } catch (e) {
      errorMessage.value = 'Failed to refresh data: $e';
      log('❌ Error refreshing data: $e');
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Check if data is cached
  bool hasCachedData() => _firebaseService.hasCachedData();

  /// Get last update time
  DateTime? getLastUpdateTime() => _firebaseService.getLastUpdateTime();
}
