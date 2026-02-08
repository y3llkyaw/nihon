import 'package:hiragana/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/fill_in_the_blank_controller.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';

Widget fillInBlankWidgets(VocabularyModel vocab) {
  final String tag =
      "${vocab.japanese}_${vocab.burmese}_fill_${DateTime.now().millisecondsSinceEpoch}";
  final controller = Get.put(FillInTheBlankController(), tag: tag);

  // Register the controller to be deleted when the lesson page is closed
  Get.find<LessonTrainningPageController>().addDisposeCallback(() {
    Get.delete<FillInTheBlankController>(tag: tag);
  });

  // Set the widget builder for retry functionality
  controller.widgetBuilder = () => fillInBlankWidgets(vocab);

  final sentence = vocab.exampleSentence;
  final textSpans = sentence.split(vocab.japanese);

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
                  color: AppColors.textWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                vocab.exampleSentenceTranslation,
                style: GoogleFonts.notoSansMyanmar(
                  color: AppColors.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Obx(
                    () => RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                        children: [
                          TextSpan(
                            text: textSpans[0],
                            style: GoogleFonts.notoSansJp(
                              color: AppColors.textWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: SizedBox(
                              width: 100,
                              child: TextField(
                                controller: controller.answerController,
                                readOnly: controller.wasCorrect.value != null,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.none,
                                style: GoogleFonts.notoSansJp(
                                  color: controller.wasCorrect.value == null
                                      ? AppColors.primary
                                      : controller.wasCorrect.value!
                                          ? Colors.green
                                          : Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4),
                                  border: UnderlineInputBorder(),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.textWhite),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text:
                                textSpans.length > 1 ? textSpans[1].trim() : "",
                            style: GoogleFonts.notoSansJp(
                              color: AppColors.textWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
            ],
          ),
          Obx(() => SizedBox(
                width: double.infinity,
                height: Get.height * 0.07,
                child: ElevatedButton(
                  onPressed: controller.wasCorrect.value != null
                      ? null
                      : () => controller.checkAnswer(vocab.japanese),
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
        ],
      ),
    ),
  );
}
