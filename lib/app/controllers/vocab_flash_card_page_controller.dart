import 'package:get/get.dart';

class VocabFlashCardPageController extends GetxController {
  final watchedList = [].obs;
  final isRomajiShown = false.obs;
  final isMeaningShown = false.obs;

  @override
  void onInit() {
    super.onInit();
    watchedList.clear();
  }
}
