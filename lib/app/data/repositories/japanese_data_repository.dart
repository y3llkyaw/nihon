import 'package:get/get.dart';
import 'package:hiragana/app/data/services/firebase_data_service.dart';

/// Repository for accessing Japanese learning data (hiragana, katakana, vocabulary)
/// Provides a clean interface for controllers and handles caching logic
class JapaneseDataRepository {
  final FirebaseDataService _firebaseService = FirebaseDataService();

  // Data state
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // Cached data
  List<Map<String, dynamic>>? _hiraganaTable;
  List<Map<String, dynamic>>? _katakanaTable;
  Map<String, String>? _hiraganaMap;
  Map<String, String>? _katakanaMap;
  List<Map<String, dynamic>>? _vocabularyLessons;

  // ========== GETTER METHODS ==========

  /// Get hiragana table
  Future<List<Map<String, dynamic>>> getHiraganaTable(
      {bool forceRefresh = false}) async {
    if (_hiraganaTable != null && !forceRefresh) {
      return _hiraganaTable!;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      _hiraganaTable =
          await _firebaseService.getHiraganaTable(forceRefresh: forceRefresh);
      return _hiraganaTable!;
    } catch (e) {
      errorMessage.value = 'Failed to load hiragana table: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Get katakana table
  Future<List<Map<String, dynamic>>> getKatakanaTable(
      {bool forceRefresh = false}) async {
    if (_katakanaTable != null && !forceRefresh) {
      return _katakanaTable!;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      _katakanaTable =
          await _firebaseService.getKatakanaTable(forceRefresh: forceRefresh);
      return _katakanaTable!;
    } catch (e) {
      errorMessage.value = 'Failed to load katakana table: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Get hiragana character map
  Future<Map<String, String>> getHiraganaMap(
      {bool forceRefresh = false}) async {
    if (_hiraganaMap != null && !forceRefresh) {
      return _hiraganaMap!;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      _hiraganaMap =
          await _firebaseService.getHiraganaMap(forceRefresh: forceRefresh);
      return _hiraganaMap!;
    } catch (e) {
      errorMessage.value = 'Failed to load hiragana map: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Get katakana character map
  Future<Map<String, String>> getKatakanaMap(
      {bool forceRefresh = false}) async {
    if (_katakanaMap != null && !forceRefresh) {
      return _katakanaMap!;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      _katakanaMap =
          await _firebaseService.getKatakanaMap(forceRefresh: forceRefresh);
      return _katakanaMap!;
    } catch (e) {
      errorMessage.value = 'Failed to load katakana map: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Get combined character map (hiragana + katakana)
  Future<Map<String, String>> getCharacterMap(
      {bool forceRefresh = false}) async {
    final hiragana = await getHiraganaMap(forceRefresh: forceRefresh);
    final katakana = await getKatakanaMap(forceRefresh: forceRefresh);
    return {...hiragana, ...katakana};
  }

  /// Get vocabulary lessons
  Future<List<Map<String, dynamic>>> getVocabularyLessons(
      {bool forceRefresh = false}) async {
    if (_vocabularyLessons != null && !forceRefresh) {
      return _vocabularyLessons!;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      _vocabularyLessons = await _firebaseService.getVocabularyLessons(
          forceRefresh: forceRefresh);
      return _vocabularyLessons!;
    } catch (e) {
      errorMessage.value = 'Failed to load vocabulary lessons: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Get a specific vocabulary lesson by index (0-based)
  Future<Map<String, dynamic>> getVocabularyLesson(int index,
      {bool forceRefresh = false}) async {
    final lessons = await getVocabularyLessons(forceRefresh: forceRefresh);
    if (index < 0 || index >= lessons.length) {
      throw RangeError(
          'Lesson index $index out of range. Valid range: 0-${lessons.length - 1}');
    }
    return lessons[index];
  }

  // ========== UTILITY METHODS ==========

  /// Initialize data (load from cache or fetch from Firebase)
  Future<void> initialize() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Check if we have cached data
      if (_firebaseService.hasCachedData()) {
        print('📦 Loading data from cache...');
        // Load all data in parallel
        await Future.wait([
          getHiraganaTable(),
          getKatakanaTable(),
          getVocabularyLessons(),
        ]);
      } else {
        print('🌐 No cached data found. Fetching from Firebase...');
        // First time - fetch from Firebase
        await Future.wait([
          getHiraganaTable(forceRefresh: true),
          getKatakanaTable(forceRefresh: true),
          getVocabularyLessons(forceRefresh: true),
        ]);
      }

      print('✅ Data repository initialized successfully');
    } catch (e) {
      errorMessage.value = 'Failed to initialize data: $e';
      print('❌ Failed to initialize repository: $e');
      rethrow;
    } finally {
      isLoading.value = false;
    }
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

      print('✅ All data refreshed from Firebase');
    } catch (e) {
      errorMessage.value = 'Failed to refresh data: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Clear all cached data
  Future<void> clearCache() async {
    await _firebaseService.clearCache();
    _hiraganaTable = null;
    _katakanaTable = null;
    _hiraganaMap = null;
    _katakanaMap = null;
    _vocabularyLessons = null;
  }

  /// Check if we have cached data
  bool hasCachedData() {
    return _firebaseService.hasCachedData();
  }

  /// Get last update time
  DateTime? getLastUpdateTime() {
    return _firebaseService.getLastUpdateTime();
  }
}
