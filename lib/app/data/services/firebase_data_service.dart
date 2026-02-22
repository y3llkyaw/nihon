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

  // ========== FETCH METHODS (With Caching) ==========

  /// Get hiragana table with caching
  Future<List<Map<String, dynamic>>> getHiraganaTable(
      {bool forceRefresh = false}) async {
    try {
      // Check cache first
      if (!forceRefresh && _storage.hasData(_hiraganaTableKey)) {
        final cached = _storage.read(_hiraganaTableKey);
        if (cached != null) {
          print('📦 Loaded hiragana table from cache');
          return List<Map<String, dynamic>>.from(jsonDecode(cached));
        }
      }

      // Fetch from Firestore
      print('🌐 Fetching hiragana table from Firestore...');
      final snapshot = await _firestore
          .collection(hiraganaTableCollection)
          .orderBy('index')
          .get();

      final table = snapshot.docs.map((doc) {
        final data = doc.data();
        data.remove('index'); // Remove the index field we added
        return data;
      }).toList();

      // Cache the data
      await _storage.write(_hiraganaTableKey, jsonEncode(table));
      await _updateLastUpdateTime();

      print('✅ Hiragana table fetched and cached');
      return table;
    } catch (e) {
      print('❌ Error fetching hiragana table: $e');
      // Try to return cached data as fallback
      if (_storage.hasData(_hiraganaTableKey)) {
        print('⚠️ Returning cached data as fallback');
        final cached = _storage.read(_hiraganaTableKey);
        return List<Map<String, dynamic>>.from(jsonDecode(cached));
      }
      rethrow;
    }
  }

  /// Get katakana table with caching
  Future<List<Map<String, dynamic>>> getKatakanaTable(
      {bool forceRefresh = false}) async {
    try {
      // Check cache first
      if (!forceRefresh && _storage.hasData(_katakanaTableKey)) {
        final cached = _storage.read(_katakanaTableKey);
        if (cached != null) {
          print('📦 Loaded katakana table from cache');
          return List<Map<String, dynamic>>.from(jsonDecode(cached));
        }
      }

      // Fetch from Firestore
      print('🌐 Fetching katakana table from Firestore...');
      final snapshot = await _firestore
          .collection(katakanaTableCollection)
          .orderBy('index')
          .get();

      final table = snapshot.docs.map((doc) {
        final data = doc.data();
        data.remove('index');
        return data;
      }).toList();

      // Cache the data
      await _storage.write(_katakanaTableKey, jsonEncode(table));
      await _updateLastUpdateTime();

      print('✅ Katakana table fetched and cached');
      return table;
    } catch (e) {
      print('❌ Error fetching katakana table: $e');
      if (_storage.hasData(_katakanaTableKey)) {
        print('⚠️ Returning cached data as fallback');
        final cached = _storage.read(_katakanaTableKey);
        return List<Map<String, dynamic>>.from(jsonDecode(cached));
      }
      rethrow;
    }
  }

  /// Get hiragana character map with caching
  Future<Map<String, String>> getHiraganaMap(
      {bool forceRefresh = false}) async {
    try {
      if (!forceRefresh && _storage.hasData(_hiraganaMapKey)) {
        final cached = _storage.read(_hiraganaMapKey);
        if (cached != null) {
          print('📦 Loaded hiragana map from cache');
          return Map<String, String>.from(jsonDecode(cached));
        }
      }

      print('🌐 Fetching hiragana map from Firestore...');
      final doc = await _firestore
          .collection(hiraganaMapCollection)
          .doc('characters')
          .get();

      if (!doc.exists || doc.data() == null) {
        throw Exception('Hiragana map not found in Firestore');
      }

      final map = Map<String, String>.from(doc.data()!['map']);

      await _storage.write(_hiraganaMapKey, jsonEncode(map));
      await _updateLastUpdateTime();

      print('✅ Hiragana map fetched and cached');
      return map;
    } catch (e) {
      print('❌ Error fetching hiragana map: $e');
      if (_storage.hasData(_hiraganaMapKey)) {
        print('⚠️ Returning cached data as fallback');
        final cached = _storage.read(_hiraganaMapKey);
        return Map<String, String>.from(jsonDecode(cached));
      }
      rethrow;
    }
  }

  /// Get katakana character map with caching
  Future<Map<String, String>> getKatakanaMap(
      {bool forceRefresh = false}) async {
    try {
      if (!forceRefresh && _storage.hasData(_katakanaMapKey)) {
        final cached = _storage.read(_katakanaMapKey);
        if (cached != null) {
          print('📦 Loaded katakana map from cache');
          return Map<String, String>.from(jsonDecode(cached));
        }
      }

      print('🌐 Fetching katakana map from Firestore...');
      final doc = await _firestore
          .collection(katakanaMapCollection)
          .doc('characters')
          .get();

      if (!doc.exists || doc.data() == null) {
        throw Exception('Katakana map not found in Firestore');
      }

      final map = Map<String, String>.from(doc.data()!['map']);

      await _storage.write(_katakanaMapKey, jsonEncode(map));
      await _updateLastUpdateTime();

      print('✅ Katakana map fetched and cached');
      return map;
    } catch (e) {
      print('❌ Error fetching katakana map: $e');
      if (_storage.hasData(_katakanaMapKey)) {
        print('⚠️ Returning cached data as fallback');
        final cached = _storage.read(_katakanaMapKey);
        return Map<String, String>.from(jsonDecode(cached));
      }
      rethrow;
    }
  }

  /// Get vocabulary lessons with caching
  Future<List<Map<String, dynamic>>> getVocabularyLessons(
      {bool forceRefresh = false}) async {
    try {
      if (!forceRefresh && _storage.hasData(_vocabLessonsKey)) {
        final cached = _storage.read(_vocabLessonsKey);
        if (cached != null) {
          print('📦 Loaded vocabulary lessons from cache');
          return List<Map<String, dynamic>>.from(jsonDecode(cached));
        }
      }

      print('🌐 Fetching vocabulary lessons from Firestore...');
      final snapshot = await _firestore
          .collection(vocabLessonsCollection)
          .orderBy('lesson_number')
          .get();

      final lessons = snapshot.docs.map((doc) {
        final data = doc.data();
        final rawVocab = data['vocabulary'];

        if (rawVocab is List) {
          // New format: Array of ordered key-value pairs
          final orderedMap = <String, dynamic>{};
          for (var item in rawVocab) {
            if (item is Map) {
              orderedMap[item['key'] as String] = item['value'];
            }
          }
          return orderedMap;
        } else {
          // Old format: Unordered Map
          return rawVocab as Map<String, dynamic>;
        }
      }).toList();

      await _storage.write(_vocabLessonsKey, jsonEncode(lessons));
      await _updateLastUpdateTime();

      print(
          '✅ Vocabulary lessons fetched and cached (${lessons.length} lessons)');
      return lessons;
    } catch (e) {
      print('❌ Error fetching vocabulary lessons: $e');
      if (_storage.hasData(_vocabLessonsKey)) {
        print('⚠️ Returning cached data as fallback');
        final cached = _storage.read(_vocabLessonsKey);
        return List<Map<String, dynamic>>.from(jsonDecode(cached));
      }
      rethrow;
    }
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
