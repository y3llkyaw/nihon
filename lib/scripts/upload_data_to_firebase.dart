import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hiragana/firebase_options.dart';
import 'package:hiragana/app/data/services/firebase_data_service.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';

/// One-time script to upload all Japanese learning data to Firebase Firestore
/// Run this with: flutter run lib/scripts/upload_data_to_firebase.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize GetStorage
  await GetStorage.init();

  runApp(const DataUploadApp());
}

class DataUploadApp extends StatelessWidget {
  const DataUploadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Data Uploader',
      home: const DataUploadPage(),
    );
  }
}

class DataUploadPage extends StatefulWidget {
  const DataUploadPage({Key? key}) : super(key: key);

  @override
  State<DataUploadPage> createState() => _DataUploadPageState();
}

class _DataUploadPageState extends State<DataUploadPage> {
  final FirebaseDataService _firebaseService = FirebaseDataService();
  final List<String> _logs = [];
  bool _isUploading = false;
  bool _uploadComplete = false;

  void _addLog(String message) {
    setState(() {
      _logs.add('[${DateTime.now().toString().substring(11, 19)}] $message');
    });
    print(message);
  }

  Future<void> _uploadAllData() async {
    if (_isUploading) return;

    setState(() {
      _isUploading = true;
      _uploadComplete = false;
      _logs.clear();
    });

    try {
      _addLog('🚀 Starting data upload to Firebase...');
      _addLog('');

      // 1. Upload Hiragana Table
      _addLog('📝 Uploading Hiragana Table...');
      await _firebaseService.uploadHiraganaTable(hiraganaTable);
      _addLog('✅ Hiragana Table uploaded (${hiraganaTable.length} rows)');
      _addLog('');

      // 2. Upload Katakana Table
      _addLog('📝 Uploading Katakana Table...');
      await _firebaseService.uploadKatakanaTable(katakanaTable);
      _addLog('✅ Katakana Table uploaded (${katakanaTable.length} rows)');
      _addLog('');

      // 3. Upload Hiragana Map
      _addLog('📝 Uploading Hiragana Character Map...');
      await _firebaseService.uploadHiraganaMap(hiraganaMap);
      _addLog('✅ Hiragana Map uploaded (${hiraganaMap.length} characters)');
      _addLog('');

      // 4. Upload Katakana Map
      _addLog('📝 Uploading Katakana Character Map...');
      await _firebaseService.uploadKatakanaMap(katakanaMap);
      _addLog('✅ Katakana Map uploaded (${katakanaMap.length} characters)');
      _addLog('');

      // 5. Upload Vocabulary Lessons
      _addLog('📝 Uploading Vocabulary Lessons...');
      await _firebaseService.uploadVocabularyLessons(vocabLessons);
      _addLog('✅ Vocabulary Lessons uploaded (${vocabLessons.length} lessons)');
      _addLog('');

      _addLog('🎉 ALL DATA UPLOADED SUCCESSFULLY!');
      _addLog('');
      _addLog('Summary:');
      _addLog('  - Hiragana Table: ${hiraganaTable.length} rows');
      _addLog('  - Katakana Table: ${katakanaTable.length} rows');
      _addLog('  - Hiragana Characters: ${hiraganaMap.length}');
      _addLog('  - Katakana Characters: ${katakanaMap.length}');
      _addLog('  - Vocabulary Lessons: ${vocabLessons.length}');

      setState(() {
        _uploadComplete = true;
      });
    } catch (e) {
      _addLog('');
      _addLog('❌ ERROR: $e');
      _addLog('');
      _addLog('Upload failed. Please check the error and try again.');
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Data Upload'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Japanese Learning Data to Firebase',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This will upload all hiragana, katakana, and vocabulary data to Firebase Firestore.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _isUploading ? null : _uploadAllData,
                      icon: _isUploading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.cloud_upload),
                      label:
                          Text(_isUploading ? 'Uploading...' : 'Start Upload'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _uploadComplete ? Colors.green : Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Upload Logs:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(12),
                child: _logs.isEmpty
                    ? const Center(
                        child: Text(
                          'No logs yet. Click "Start Upload" to begin.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _logs.length,
                        itemBuilder: (context, index) {
                          final log = _logs[index];
                          Color textColor = Colors.white;

                          if (log.contains('✅')) {
                            textColor = Colors.greenAccent;
                          } else if (log.contains('❌')) {
                            textColor = Colors.redAccent;
                          } else if (log.contains('📝')) {
                            textColor = Colors.blueAccent;
                          } else if (log.contains('🎉')) {
                            textColor = Colors.yellowAccent;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              log,
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'monospace',
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
