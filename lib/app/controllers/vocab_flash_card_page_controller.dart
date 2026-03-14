import 'package:get/get.dart';

class VocabFlashCardPageController extends GetxController {
  final watchedList = [].obs;
  final isRomajiShown = true.obs;
  final isMeaningShown = true.obs;
  final isExampleSentenceSpoken = false.obs;
  final isAutoSlide = false.obs;
  final isImageShow = false.obs;
  final isQuizMode = false.obs;
  final isShuffled = false.obs;

  void toggleQuizMode() {
    isQuizMode.value = !isQuizMode.value;
    if (isQuizMode.value) {
      // Hide meaning, romaji, and image immediately when entering quiz mode
      isMeaningShown.value = false;
      isRomajiShown.value = false;
      isImageShow.value = false;
    } else {
      // Revert to default visible state
      isMeaningShown.value = true;
      isRomajiShown.value = true;
      isImageShow.value = true;
    }
  }

  void toggleShuffle() {
    isShuffled.value = !isShuffled.value;
  }

  @override
  void onInit() {
    super.onInit();
    watchedList.clear();
  }
}
