import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TtsController extends GetxController {
  final FlutterTts tts = FlutterTts();
  final speakingWord = ''.obs;
  final isSpeaking = false.obs;

  Completer<void>? _speechCompleter;

  @override
  void onInit() async {
    super.onInit();
    await tts.setLanguage("ja-JP"); // Japanese voice
    await tts.setSpeechRate(0.5); // adjust speaking speed
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

    if (kIsWeb) {
      // use browser speech synthesis via JS and await estimated duration
      final safeText = text.replaceAll("'", r"\'").replaceAll('\n', ' ');
      js.context.callMethod('eval', [
        """
        speechSynthesis.cancel();
        const utter = new SpeechSynthesisUtterance('$safeText');
        utter.lang = 'ja-JP';
        utter.rate = 0.9;
        speechSynthesis.speak(utter);
      """
      ]);

      final estimatedMs = math.min(10000, math.max(800, text.length * 250));
      try {
        await Future.delayed(Duration(milliseconds: estimatedMs));
      } finally {
        if (speakingWord.value == text) speakingWord.value = "";
      }
      return;
    }

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
      if (kIsWeb) {
        js.context.callMethod('eval', [
          """
        speechSynthesis.stop();
        """
        ]);
      } else {
        await tts.stop();
      }
    } catch (e) {
      try {
        await tts.stop();
      } catch (_) {}
    } finally {
      speakingWord.value = "";
    }
  }
}
