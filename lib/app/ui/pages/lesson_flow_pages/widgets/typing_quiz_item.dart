import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';

import '../lesson_training_page.dart';

Widget buildTypingQuizItem(String japanese, CarouselSliderController csc) {
  final TextEditingController answerController = TextEditingController();
  final TtsController ttsController = TtsController();

  final LessonTrainningPageController controller = Get.find();
  bool? wasCorrect;

  return StatefulBuilder(builder: (context, setState) {
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
                  "Type what you hear",
                  style: GoogleFonts.lexend(
                    color: LessonTrainingPage.textWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                await ttsController.speak(japanese);
              },
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: Get.width * 0.25,
                height: Get.width * 0.25,
                decoration: const BoxDecoration(
                  color: LessonTrainingPage.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.volume_up,
                  color: LessonTrainingPage.textWhite,
                  size: 48,
                ),
              ),
            ),
            Column(
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  readOnly: wasCorrect != null,
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
                          color: wasCorrect == null
                              ? LessonTrainingPage.textWhite
                                  .withValues(alpha: 0.1)
                              : wasCorrect!
                                  ? Colors.green
                                  : Colors.red,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: wasCorrect == null
                              ? LessonTrainingPage.primary
                              : wasCorrect!
                                  ? Colors.green
                                  : Colors.red,
                          width: 2),
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
                onPressed: wasCorrect != null
                    ? null
                    : () {
                        final cleanJapanese =
                            japanese.replaceAll("～", "").replaceAll(" ", "");
                        final isCorrect =
                            answerController.text.trim() == cleanJapanese;
                        setState(() {
                          wasCorrect = isCorrect;
                        });

                        if (isCorrect) {
                          controller.finished.value += 1;
                          log("Correct Answer: ${answerController.text}");
                          Future.delayed(const Duration(milliseconds: 800), () {
                            csc.nextPage();
                          });
                        } else {
                          log("Incorrect!\n Correct Answer: $cleanJapanese");
                          Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.red.shade900,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Incorrect. The correct answer is:',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    cleanJapanese,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      csc.nextPage();
                                    },
                                    child: const Text('CONTINUE'),
                                  ),
                                ],
                              ),
                            ),
                            isDismissible: false,
                            enableDrag: false,
                          );
                        }
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
  });
}
