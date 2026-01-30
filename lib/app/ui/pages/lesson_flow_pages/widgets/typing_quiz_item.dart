import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/typing_quiz_controller.dart';

import '../lesson_training_page.dart';

Widget buildTypingQuizItem(String japanese) {
  final String tag =
      "${japanese}_typing_${DateTime.now().millisecondsSinceEpoch}";
  final controller = Get.put(TypingQuizController(), tag: tag);

  // Set the widget builder for retry functionality
  controller.widgetBuilder = () => buildTypingQuizItem(japanese);

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
            onTap: () {
              controller.ttsController.speak(japanese);
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
              Obx(() => TextField(
                    textAlign: TextAlign.center,
                    readOnly: controller.wasCorrect.value != null,
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
                            color: controller.wasCorrect.value == null
                                ? LessonTrainingPage.textWhite
                                    .withValues(alpha: 0.1)
                                : controller.wasCorrect.value!
                                    ? Colors.green
                                    : Colors.red,
                            width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: controller.wasCorrect.value == null
                                ? LessonTrainingPage.primary
                                : controller.wasCorrect.value!
                                    ? Colors.green
                                    : Colors.red,
                            width: 2),
                      ),
                    ),
                    controller: controller.answerController,
                  )),
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
          Obx(() => SizedBox(
                width: double.infinity,
                height: Get.height * 0.07,
                child: ElevatedButton(
                  onPressed: controller.wasCorrect.value != null
                      ? null
                      : () => controller.checkAnswer(japanese),
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
              )),
        ],
      ),
    ),
  );
}
