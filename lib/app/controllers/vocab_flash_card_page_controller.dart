import 'package:get/get.dart';

class VocabFlashCardPageController extends GetxController {
  final watchedList = [].obs;
  final isRomajiShown = true.obs;
  final isMeaningShown = true.obs;
  final isAutoSlide = false.obs;
  final isImageShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    watchedList.clear();
  }
}
