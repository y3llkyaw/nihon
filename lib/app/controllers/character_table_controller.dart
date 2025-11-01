import 'package:get/get.dart';

class CharacterTableController extends GetxController {
  final RxList<String> selectedHiragana = <String>[].obs;
  

  void toggleHiraganaSelection(String hiragana) {
    if (selectedHiragana.contains(hiragana)) {
      selectedHiragana.remove(hiragana);
    } else {
      selectedHiragana.add(hiragana);
    }
  }
}
