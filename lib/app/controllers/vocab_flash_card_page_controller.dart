import 'package:get/get.dart';

class VocabFlashCardPageController extends GetxController {
  final watchedList = [].obs;

  @override
  void onInit() {
    super.onInit();
    watchedList.clear();
  }
}
