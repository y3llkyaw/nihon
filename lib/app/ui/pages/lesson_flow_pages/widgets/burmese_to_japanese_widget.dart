import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';

Widget buildBurmeseToJapaneseQuizItem(
  MapEntry<String, List<dynamic>> entry,
  CarouselSliderController csc,
  List<dynamic> possibleAnswers, {
  bool isJapaneseToBurmese = false,
}) {
  final LessonTrainningPageController controller = Get.find();
  final TtsController ttsController = TtsController();
  return SizedBox(
    height: Get.height * 0.5,
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            !isJapaneseToBurmese ? entry.key : entry.value[0],
            style: TextStyle(
              color: Colors.white,
              fontSize: isJapaneseToBurmese ? 32 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
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
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            shrinkWrap: true,
            itemCount: possibleAnswers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              String option = possibleAnswers[index];
              return ElevatedButton(
                onPressed: () async {
                  if (option == entry.value[0] || option == entry.key) {
                    csc.nextPage();
                    controller.finished.value += 1;
                    log("Correct Answer: $option");
                    if (!isJapaneseToBurmese) {
                      await ttsController.speak(option);
                    }
                  } else {
                    // Handle incorrect answer
                  }
                },
                child: Text(
                  option,
                  style: TextStyle(
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
}
