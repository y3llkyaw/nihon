import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/controllers/burmese_to_japanese_widget_controller.dart';

Widget buildBurmeseToJapaneseQuizItem(
  VocabularyModel vocab,
  List<String> possibleAnswers, {
  bool isJapaneseToBurmese = false,
}) {
  final String tag =
      "${vocab.japanese}_${isJapaneseToBurmese}_${vocab.burmese}_${DateTime.now().millisecondsSinceEpoch}";
  final controller = Get.put(BurmeseToJapaneseWidgetController(), tag: tag);

  // Set the widget builder for retry functionality
  controller.widgetBuilder = () => buildBurmeseToJapaneseQuizItem(
        vocab,
        possibleAnswers,
        isJapaneseToBurmese: isJapaneseToBurmese,
      );
  return SizedBox(
    height: Get.height * 0.5,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            !isJapaneseToBurmese ? vocab.burmese : vocab.japanese,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isJapaneseToBurmese ? 32 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Select the correct ${!isJapaneseToBurmese ? "Japanese" : "Burmese"} translation",
            style: TextStyle(
              color: Colors.white.withAlpha(150),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
          ),
          GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            shrinkWrap: true,
            itemCount: possibleAnswers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              String option = possibleAnswers[index].toString();
              final correctAnswer =
                  isJapaneseToBurmese ? vocab.burmese : vocab.japanese;
              final isCorrect = option == correctAnswer;

              return Obx(() {
                Color? buttonColor;
                if (controller.selectedOption.value != null) {
                  if (isCorrect) {
                    // Show green for correct answer if selection made
                    buttonColor = Colors.green.withOpacity(0.5);
                  } else if (controller.selectedOption.value == option) {
                    // Show red for the wrong option that was selected
                    buttonColor = Colors.red.withOpacity(0.5);
                  }
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: controller.selectedOption.value != null
                      ? null
                      : () => controller.handleAnswerSelection(
                            option,
                            correctAnswer,
                            isJapaneseToBurmese,
                          ),
                  child: Text(
                    option,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    ),
  );
}
