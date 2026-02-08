import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/controllers/burmese_to_japanese_widget_controller.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

Widget buildBurmeseToJapaneseQuizItem(
  VocabularyModel vocab,
  List<String> possibleAnswers, {
  bool isJapaneseToBurmese = false,
}) {
  final String tag =
      "${vocab.japanese}_${isJapaneseToBurmese}_${vocab.burmese}_${DateTime.now().millisecondsSinceEpoch}";
  final controller = Get.put(BurmeseToJapaneseWidgetController(), tag: tag);

  // Register the controller to be deleted when the lesson page is closed
  Get.find<LessonTrainningPageController>().addDisposeCallback(() {
    Get.delete<BurmeseToJapaneseWidgetController>(tag: tag);
  });

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
          ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            shrinkWrap: true,
            itemCount: possibleAnswers.length,
            itemBuilder: (context, index) {
              String option = possibleAnswers[index].toString();
              final correctAnswer =
                  isJapaneseToBurmese ? vocab.burmese : vocab.japanese;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.inputFill,
                    disabledBackgroundColor: AppColors.inputFill,
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => controller.handleAnswerSelection(
                    option,
                    correctAnswer,
                    isJapaneseToBurmese,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: isJapaneseToBurmese
                          ? GoogleFonts.notoSansMyanmar(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                            )
                          : GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
