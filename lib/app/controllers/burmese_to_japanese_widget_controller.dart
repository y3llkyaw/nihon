import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';

class BurmeseToJapaneseWidgetController extends GetxController {
  final LessonTrainningPageController lessonController = Get.find();
  final TtsController ttsController = Get.find();

  final selectedOption = RxnString();
  final wasCorrect = RxnBool();

  /// Widget builder for retry functionality
  Widget Function()? widgetBuilder;

  Future<void> handleAnswerSelection(
    String option,
    String correctAnswer,
    bool isJapaneseToBurmese,
  ) async {
    selectedOption.value = option;
    wasCorrect.value = option == correctAnswer;

    if (wasCorrect.value == true) {
      log("Correct Answer: $option");

      // Play TTS without awaiting (fire and forget)
      if (!isJapaneseToBurmese) {
        ttsController.speak(option);
      }

      // Handle correct answer - increments count and checks if lesson is complete
      final isComplete = await lessonController.onCorrectAnswer();

      // Only advance to next page if lesson is not complete
      if (!isComplete) {
        await lessonController.advanceToNextPage();
      }
    } else {
      // Add the widget again for retry
      if (widgetBuilder != null) {
        lessonController.addRetryWidget(widgetBuilder!);
      }

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
              Text(
                'Incorrect. The correct answer is:',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(height: 8),
              Text(
                correctAnswer,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  lessonController.carouselController.value.nextPage();
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
  }
}
