import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VocabTrainingController extends GetxController {
  final Map<String, List<String>> lesson = {};
  final doneList = [].obs;

  var selectedBuremese = "".obs;
  var selectedJapanese = "".obs;

  bool isAnswerCorrect(BuildContext context) {
    final burmese = selectedBuremese.value;
    final japanese = selectedJapanese.value;
    final correctAnswer = lesson[burmese]![0];

    if (correctAnswer == japanese) {
      final player = AudioPlayer();
      player.play(AssetSource('audios/ss.mp3'));
      doneList.add(burmese);
      doneList.add(japanese);
      resetSelection();
      return true;
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
