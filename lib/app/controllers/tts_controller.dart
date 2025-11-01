import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TtsController extends GetxController {
  final FlutterTts tts = FlutterTts();

  @override
  void onInit() async {
    super.onInit();
    await tts.setLanguage("ja-JP"); // Japanese voice
    await tts.setSpeechRate(0.5); // adjust speaking speed
    await tts.setVolume(1.0);
  }

  Future<void> speak(String text) async {
    if (kIsWeb) {
      // use browser speech synthesis
      js.context.callMethod('eval', [
        """
        const utter = new SpeechSynthesisUtterance('$text');
        utter.lang = 'ja-JP';
        utter.rate = 0.9;
        speechSynthesis.speak(utter);
      """
      ]);
    } else {
      await tts.setLanguage('ja-JP');
      await tts.setSpeechRate(0.5);
      await tts.setVolume(1.0);
      await tts.speak(text);
    }
  }

  Future<void> stop() async {
    await tts.stop();
  }
}
