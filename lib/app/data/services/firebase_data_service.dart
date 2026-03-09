import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

/// Service to handle all Firebase Firestore operations for Japanese learning data
class FirebaseDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();

  // Cache keys
  static const String _hiraganaTableKey = 'hiragana_table_cache';
  static const String _katakanaTableKey = 'katakana_table_cache';
  static const String _hiraganaMapKey = 'hiragana_map_cache';
  static const String _katakanaMapKey = 'katakana_map_cache';
  static const String _vocabLessonsKey = 'vocab_lessons_cache';
  static const String _lastUpdateKey = 'data_last_update';

  // Collection names
  static const String hiraganaTableCollection = 'hiragana_table';
  static const String katakanaTableCollection = 'katakana_table';
  static const String hiraganaMapCollection = 'hiragana_map';
  static const String katakanaMapCollection = 'katakana_map';
  static const String vocabLessonsCollection = 'vocabulary_lessons';

  // ========== UPLOAD METHODS (One-time use) ==========

  /// Upload hiragana table data to Firestore
  Future<void> uploadHiraganaTable(List<Map<String, dynamic>> table) async {
    try {
      final batch = _firestore.batch();

      for (int i = 0; i < table.length; i++) {
        final docRef =
            _firestore.collection(hiraganaTableCollection).doc('row_$i');
        batch.set(docRef, {
          ...table[i],
          'index': i,
        });
      }

      await batch.commit();
      print('✅ Hiragana table uploaded successfully');
    } catch (e) {
      print('❌ Error uploading hiragana table: $e');
      rethrow;
    }
  }

  /// Upload katakana table data to Firestore
  Future<void> uploadKatakanaTable(List<Map<String, dynamic>> table) async {
    try {
      final batch = _firestore.batch();

      for (int i = 0; i < table.length; i++) {
        final docRef =
            _firestore.collection(katakanaTableCollection).doc('row_$i');
        batch.set(docRef, {
          ...table[i],
          'index': i,
        });
      }

      await batch.commit();
      print('✅ Katakana table uploaded successfully');
    } catch (e) {
      print('❌ Error uploading katakana table: $e');
      rethrow;
    }
  }

  /// Upload hiragana character map to Firestore
  Future<void> uploadHiraganaMap(Map<String, String> characterMap) async {
    try {
      await _firestore
          .collection(hiraganaMapCollection)
          .doc('characters')
          .set({'map': characterMap});

      print('✅ Hiragana map uploaded successfully');
    } catch (e) {
      print('❌ Error uploading hiragana map: $e');
      rethrow;
    }
  }

  /// Upload katakana character map to Firestore
  Future<void> uploadKatakanaMap(Map<String, String> characterMap) async {
    try {
      await _firestore
          .collection(katakanaMapCollection)
          .doc('characters')
          .set({'map': characterMap});

      print('✅ Katakana map uploaded successfully');
    } catch (e) {
      print('❌ Error uploading katakana map: $e');
      rethrow;
    }
  }

  /// Upload vocabulary lessons to Firestore
  Future<void> uploadVocabularyLessons(
      List<Map<String, dynamic>> lessons) async {
    try {
      final batch = _firestore.batch();

      for (int i = 0; i < lessons.length; i++) {
        final docRef = _firestore
            .collection(vocabLessonsCollection)
            .doc('lesson_${i + 1}');
        // Convert Map to ordered List of key-value pairs
        final orderedList = lessons[i]
            .entries
            .map((e) => {
                  'key': e.key,
                  'value': e.value,
                })
            .toList();

        batch.set(docRef, {
          'lesson_number': i + 1,
          'vocabulary': orderedList,
        });
      }

      await batch.commit();
      print(
          '✅ Vocabulary lessons uploaded successfully (${lessons.length} lessons)');
    } catch (e) {
      print('❌ Error uploading vocabulary lessons: $e');
      rethrow;
    }
  }

  // ========== GENERIC FETCH WITH CACHE ==========

  /// Generic helper that encapsulates the check-cache → fetch → cache → fallback pattern.
  Future<T> _fetchWithCache<T>({
    required String cacheKey,
    required String label,
    required Future<T> Function() fetcher,
    required T Function(dynamic cached) decoder,
    bool forceRefresh = false,
  }) async {
    try {
      // Check cache first
      if (!forceRefresh && _storage.hasData(cacheKey)) {
        final cached = _storage.read(cacheKey);
        if (cached != null) {
          print('📦 Loaded $label from cache');
          return decoder(jsonDecode(cached));
        }
      }

      // Fetch from source
      print('🌐 Fetching $label from Firestore...');
      final data = await fetcher();

      // Cache the result
      await _storage.write(cacheKey, jsonEncode(data));
      await _updateLastUpdateTime();

      print('✅ $label fetched and cached');
      return data;
    } catch (e) {
      print('❌ Error fetching $label: $e');
      // Fallback to cached data
      if (_storage.hasData(cacheKey)) {
        print('⚠️ Returning cached $label as fallback');
        final cached = _storage.read(cacheKey);
        return decoder(jsonDecode(cached));
      }
      rethrow;
    }
  }

  // ========== FETCH METHODS ==========

  /// Fetches an ordered table collection from Firestore (hiragana/katakana tables).
  Future<List<Map<String, dynamic>>> _fetchOrderedTable(
      String collection) async {
    final snapshot =
        await _firestore.collection(collection).orderBy('index').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data.remove('index');
      return data;
    }).toList();
  }

  /// Fetches a character map document from Firestore.
  Future<Map<String, String>> _fetchCharacterMapDoc(String collection) async {
    final doc = await _firestore.collection(collection).doc('characters').get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('$collection map not found in Firestore');
    }
    return Map<String, String>.from(doc.data()!['map']);
  }

  /// Get hiragana table with caching
  Future<List<Map<String, dynamic>>> getHiraganaTable(
      {bool forceRefresh = false}) {
    return _fetchWithCache(
      cacheKey: _hiraganaTableKey,
      label: 'hiragana table',
      forceRefresh: forceRefresh,
      fetcher: () => _fetchOrderedTable(hiraganaTableCollection),
      decoder: (cached) => List<Map<String, dynamic>>.from(cached),
    );
  }

  /// Get katakana table with caching
  Future<List<Map<String, dynamic>>> getKatakanaTable(
      {bool forceRefresh = false}) {
    return _fetchWithCache(
      cacheKey: _katakanaTableKey,
      label: 'katakana table',
      forceRefresh: forceRefresh,
      fetcher: () => _fetchOrderedTable(katakanaTableCollection),
      decoder: (cached) => List<Map<String, dynamic>>.from(cached),
    );
  }

  /// Get hiragana character map with caching
  Future<Map<String, String>> getHiraganaMap({bool forceRefresh = false}) {
    return _fetchWithCache(
      cacheKey: _hiraganaMapKey,
      label: 'hiragana map',
      forceRefresh: forceRefresh,
      fetcher: () => _fetchCharacterMapDoc(hiraganaMapCollection),
      decoder: (cached) => Map<String, String>.from(cached),
    );
  }

  /// Get katakana character map with caching
  Future<Map<String, String>> getKatakanaMap({bool forceRefresh = false}) {
    return _fetchWithCache(
      cacheKey: _katakanaMapKey,
      label: 'katakana map',
      forceRefresh: forceRefresh,
      fetcher: () => _fetchCharacterMapDoc(katakanaMapCollection),
      decoder: (cached) => Map<String, String>.from(cached),
    );
  }

  /// Get vocabulary lessons with caching
  Future<List<Map<String, dynamic>>> getVocabularyLessons(
      {bool forceRefresh = false}) {
    return _fetchWithCache(
      cacheKey: _vocabLessonsKey,
      label: 'vocabulary lessons',
      forceRefresh: forceRefresh,
      fetcher: () async {
        final snapshot = await _firestore
            .collection(vocabLessonsCollection)
            .orderBy('lesson_number')
            .get();
        return snapshot.docs.map((doc) {
          final data = doc.data();
          final rawVocab = data['vocabulary'];
          if (rawVocab is List) {
            final orderedMap = <String, dynamic>{};
            for (var item in rawVocab) {
              if (item is Map) {
                orderedMap[item['key'] as String] = item['value'];
              }
            }
            return orderedMap;
          } else {
            return rawVocab as Map<String, dynamic>;
          }
        }).toList();
      },
      decoder: (cached) => List<Map<String, dynamic>>.from(cached),
    );
  }

  /// Get combined character map (hiragana + katakana)
  Future<Map<String, String>> getCharacterMap(
      {bool forceRefresh = false}) async {
    final hiragana = await getHiraganaMap(forceRefresh: forceRefresh);
    final katakana = await getKatakanaMap(forceRefresh: forceRefresh);
    return {...hiragana, ...katakana};
  }

  // ========== UTILITY METHODS ==========

  /// Clear all cached data
  Future<void> clearCache() async {
    await _storage.remove(_hiraganaTableKey);
    await _storage.remove(_katakanaTableKey);
    await _storage.remove(_hiraganaMapKey);
    await _storage.remove(_katakanaMapKey);
    await _storage.remove(_vocabLessonsKey);
    await _storage.remove(_lastUpdateKey);
    print('🗑️ All cached data cleared');
  }

  /// Check if cache exists
  bool hasCachedData() {
    return _storage.hasData(_hiraganaTableKey) &&
        _storage.hasData(_katakanaTableKey) &&
        _storage.hasData(_vocabLessonsKey);
  }

  /// Get last update time
  DateTime? getLastUpdateTime() {
    final timestamp = _storage.read(_lastUpdateKey);
    if (timestamp != null) {
      return DateTime.parse(timestamp);
    }
    return null;
  }

  /// Update last update timestamp
  Future<void> _updateLastUpdateTime() async {
    await _storage.write(_lastUpdateKey, DateTime.now().toIso8601String());
  }
}
