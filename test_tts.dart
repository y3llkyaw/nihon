import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterTts tts = FlutterTts();
  dynamic languages = await tts.getLanguages;
  print("Available languages: $languages");
  bool isMMSupported = await tts.isLanguageAvailable("my-MM");
  print("is my-MM supported? $isMMSupported");
}
