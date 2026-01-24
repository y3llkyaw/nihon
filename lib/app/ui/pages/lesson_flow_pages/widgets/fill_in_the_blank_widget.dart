import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';

import '../lesson_training_page.dart';

Widget fillInBlankWidgets(
  MapEntry<String, List<dynamic>> entry,
  CarouselSliderController csc,
) {
  final TextEditingController answerController = TextEditingController();

  final TtsController ttsController = TtsController();
  final LessonTrainningPageController controller = Get.find();

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
              // Text(
              //   entry.value.last.split('\n')[0],
              //   style: GoogleFonts.lexend(
              //     color: LessonTrainingPage.textWhite,
              //     fontSize: 24,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              TextField(
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4.0,
                ),
                decoration: InputDecoration(
                  hintText: "ひらがな",
                  hintStyle: TextStyle(
                      color: LessonTrainingPage.textWhite
                          .withValues(alpha: 0.2)),
                  filled: true,
                  fillColor:
                      LessonTrainingPage.textWhite.withValues(alpha: 0.05),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: LessonTrainingPage.textWhite
                            .withValues(alpha: 0.1),
                        width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: LessonTrainingPage.textWhite
                            .withValues(alpha: 0.1),
                        width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: LessonTrainingPage.primary, width: 2),
                  ),
                ),
                controller: answerController,
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
              onPressed: () {
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
