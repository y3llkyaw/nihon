import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_training_page.dart';

Widget buildBurmeseToJapaneseQuizItem(
  MapEntry<String, List<dynamic>> entry,
  CarouselSliderController csc,
  List<dynamic> possibleAnswers, {
  bool isJapaneseToBurmese = false,
}) {
  final LessonTrainningPageController controller = Get.find();
  final TtsController ttsController = Get.put(TtsController());

  String? selectedOption;
  bool? wasCorrect;

  return StatefulBuilder(builder: (context, setState) {
    return SizedBox(
      height: Get.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !isJapaneseToBurmese ? entry.key : entry.value[0],
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
                String option = possibleAnswers[index];
                final correctAnswer =
                    isJapaneseToBurmese ? entry.key : entry.value[0];
                bool isCorrect = option == correctAnswer;

                Color? buttonColor;
                if (selectedOption != null) {
                  if (isCorrect) {
                    buttonColor = Colors.green.withOpacity(0.5);
                  } else if (selectedOption == option) {
                    buttonColor = Colors.red.withOpacity(0.5);
                  }
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: selectedOption != null
                      ? null
                      : () async {
                          setState(() {
                            selectedOption = option;
                            wasCorrect = isCorrect;
                          });

                          if (wasCorrect!) {
                            controller.finished.value += 1;
                            log("Correct Answer: $option");
                            if (!isJapaneseToBurmese) {
                              await ttsController.speak(option);
                            }
                            await Future.delayed(
                                const Duration(milliseconds: 800));
                            csc.nextPage();
                          } else {
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
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8)),
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
                  child: Text(
                    option,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  });
}
