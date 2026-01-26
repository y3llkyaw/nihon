import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';

import '../lesson_training_page.dart';

Widget fillInBlankWidgets(
  MapEntry<String, List<dynamic>> entry,
  CarouselSliderController csc,
) {
  final TextEditingController answerController = TextEditingController();

  final TtsController ttsController = TtsController();
  final UserController userController = Get.put(UserController());
  final LessonTrainningPageController controller = Get.find();
  final sentence = entry.value.last.split('\n')[0];
  final textSpans = sentence.split(entry.value.first);

  return SizedBox(
    height: Get.height * 0.5,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "QUIZ MODE",
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                entry.value.last
                    .split('\n')[1]
                    .replaceAll(' ', '')
                    .replaceAll('(', '')
                    .replaceAll(')', ''),
                style: GoogleFonts.notoSansMyanmar(
                  color: LessonTrainingPage.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(
                      text: textSpans[0],
                      style: GoogleFonts.notoSansJavanese(
                        color: LessonTrainingPage.textWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(
                        width: 80,
                        child: TextField(
                          controller: answerController,
                          style: GoogleFonts.notoSansMyanmar(
                            color: LessonTrainingPage.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: textSpans.length > 1 ? textSpans[1].trim() : "",
                      style: GoogleFonts.notoSansMyanmar(
                        color: LessonTrainingPage.textWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Japanese Keyboard Active",
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: Get.height * 0.07,
            child: ElevatedButton(
              onPressed: () async {
                if (answerController.text.trim() == entry.value.first.trim()) {
                  controller.finished.value++;
                  csc.nextPage();

                  log(controller.finished.value.toString());
                  log(controller.widgetList.length.toString());
                  log(controller.chunk.toString());
                  log(controller.lesson.toString());

                  if (controller.finished.value >=
                      controller.widgetList.length) {
                    await userController.addFinishedChunk(
                        controller.lesson.value, controller.chunk.value);
                    await AudioPlayer().play(AssetSource('audios/ss.mp3'));
                    Get.back(result: true);
                    Get.back(result: true);
                  }
                } else {}
                // check answer
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: LessonTrainingPage.textWhite,
                foregroundColor: LessonTrainingPage.backgroundDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check",
                    style: GoogleFonts.lexend(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
