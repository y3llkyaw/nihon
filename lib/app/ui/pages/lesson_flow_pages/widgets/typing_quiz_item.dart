import 'package:hiragana/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/typing_quiz_controller.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';

Widget buildTypingQuizItem(String japanese) {
  final String tag =
      "${japanese}_typing_${DateTime.now().millisecondsSinceEpoch}";
  final controller = Get.put(TypingQuizController(), tag: tag);

  // Register the controller to be deleted when the lesson page is closed
  Get.find<LessonTrainningPageController>().addDisposeCallback(() {
    Get.delete<TypingQuizController>(tag: tag);
  });

  // Set the widget builder for retry functionality
  controller.widgetBuilder = () => buildTypingQuizItem(japanese);

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "QUIZ MODE",
                style: GoogleFonts.lexend(
                  color: AppColors.textWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Type what you hear",
                style: GoogleFonts.lexend(
                  color: AppColors.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              controller.ttsController.speak(japanese);
            },
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: Get.width * 0.25,
              height: Get.width * 0.25,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.volume_up,
                color: AppColors.textWhite,
                size: 48,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Obx(() => TextField(
                    textAlign: TextAlign.center,
                    readOnly: controller.wasCorrect.value != null,
                    style: GoogleFonts.lexend(
                      color: AppColors.textWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "ひらがな",
                      hintStyle: TextStyle(
                          color: AppColors.textWhite.withValues(alpha: 0.2)),
                      filled: true,
                      fillColor: AppColors.textWhite.withValues(alpha: 0.05),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: AppColors.textWhite.withValues(alpha: 0.1),
                            width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: controller.wasCorrect.value == null
                                ? AppColors.textWhite.withValues(alpha: 0.1)
                                : controller.wasCorrect.value!
                                    ? Colors.green
                                    : Colors.red,
                            width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: controller.wasCorrect.value == null
                                ? AppColors.primary
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
                  color: AppColors.textWhite.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Obx(() => SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: controller.wasCorrect.value != null
                      ? null
                      : () => controller.checkAnswer(japanese),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textWhite,
                    foregroundColor: AppColors.backgroundDark,
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
          // Add padding for keyboard
          SizedBox(
              height:
                  MediaQuery.of(Get.context!).viewInsets.bottom > 0 ? 20 : 0),
        ],
      ),
    ),
  );
}
