import 'dart:async';
import 'dart:developer';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class TtsController extends GetxController {
  final FlutterTts tts = FlutterTts();
  final speakingWord = ''.obs;
  final isSpeaking = false.obs;
  final duration = 0.obs;

  Completer<void>? _speechCompleter;

  @override
  void onInit() async {
    super.onInit();
    await tts.setLanguage("ja-JP"); // Japanese voice
    await tts.setSpeechRate(1); // adjust speaking speed
    await tts.setVolume(1.0);

    // native handlers to complete the completer when speech ends/errors
    try {
      tts.setCompletionHandler(() {
        if (_speechCompleter != null && !_speechCompleter!.isCompleted) {
          _speechCompleter!.complete();
        }
        speakingWord.value = "";
      });
      tts.setErrorHandler((msg) {
        if (_speechCompleter != null && !_speechCompleter!.isCompleted) {
          _speechCompleter!.completeError(msg ?? 'tts error');
        }
        speakingWord.value = "";
      });
    } catch (_) {}
  }

  Future<void> speak(String text) async {
    speakingWord.value = text;
    log(" TTS Speak: $text");
    // native path: use completer + flutter_tts handlers
    _speechCompleter = Completer<void>();
    try {
      await tts.setLanguage('ja-JP');
      await tts.setSpeechRate(0.5);
      await tts.setVolume(1.0);
      await tts.speak(text);
      // wait until completion handler completes the completer
      await _speechCompleter!.future;
    } catch (e) {
      // ensure cleared on error
      speakingWord.value = "";
    } finally {
      if (speakingWord.value == text) speakingWord.value = "";
      _speechCompleter = null;
    }
  }

  Future<void> stop() async {
    isSpeaking.value = false;
    // complete any pending completer so awaits end
    if (_speechCompleter != null && !_speechCompleter!.isCompleted) {
      _speechCompleter!.complete();
    }
    _speechCompleter = null;
    try {
      await tts.stop();
    } catch (e) {
      try {
        await tts.stop();
      } catch (_) {}
    } finally {
      speakingWord.value = "";
    }
  }
}
