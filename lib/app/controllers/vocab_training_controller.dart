import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';

class VocabTrainingController extends GetxController {
  final Map<String, VocabularyModel> lesson = {};
  final doneList = [].obs;

  final hintLeft = 3.obs;
  final heartLeft = 3.obs;
  final point = 0.obs;

  var carouselController = CarouselSliderController().obs;
  var selectedBuremese = "".obs;
  var selectedJapanese = "".obs;

  Future<bool> isAnswerCorrect(BuildContext context) async {
    final burmese = selectedBuremese.value;
    final japanese = selectedJapanese.value;
    if (!lesson.containsKey(burmese)) {
      // This can happen if the lesson data is not loaded correctly for the current view.
      // Resetting selection to allow the user to try again without crashing.
      resetSelection();
      return false;
    }
    final correctAnswer = lesson[burmese]!.japanese;
    if (correctAnswer == japanese) {
      final player = AudioPlayer();
      player.play(AssetSource('audios/ss.mp3'));
      doneList.add(burmese);
      doneList.add(japanese);
      resetSelection();
      if (doneList.length >= lesson.length * 2) {
        // Handle lesson completion when all matches are done
        final lessonController = Get.find<LessonTrainningPageController>();
        final isComplete = await lessonController.onCorrectAnswer();

        // Only advance to next page if lesson is not complete
        if (!isComplete) {
          await lessonController.advanceToNextPage(
              delay: const Duration(milliseconds: 300));
        }
      }
      point.value += 60;
      return true;
    }
    if (heartLeft.value > 0) {
      // Get.back();
      heartLeft.value -= 1;
    }
    wrongSnack(context, burmese, correctAnswer);
    resetSelection();

    return false;
  }

  void selectBurmese(String burmese, BuildContext context) {
    selectedBuremese.value = burmese;
    if (selectedJapanese.value != "") {
      isAnswerCorrect(context);
    }
  }

  void selectJapanese(String japanese, BuildContext context) {
    selectedJapanese.value = japanese;
    if (selectedBuremese.value != "") {
      isAnswerCorrect(context);
    }
  }

  void resetSelection() {
    selectedBuremese.value = "";
    selectedJapanese.value = "";
  }

  void wrongSnack(
      BuildContext context, String burmese, String correctJapanese) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Get.theme.colorScheme.errorContainer,
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              correctJapanese,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansJavanese(
                fontSize: 20,
                color: Get.theme.colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              burmese,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansMyanmar(
                fontSize: Get.theme.textTheme.bodyMedium!.fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(milliseconds: 3000),
    ));
  }
}
