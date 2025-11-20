import 'package:get/get.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';

class CharacterTableController extends GetxController {
  final RxList<String> selectedCharacters = <String>[].obs;
  final RxList<String> gameCharacters = <String>[].obs;

  void toggleCharacterSelection(String character) {
    if (selectedCharacters.contains(character)) {
      selectedCharacters.remove(character);
    } else {
      selectedCharacters.add(character);
    }
  }

  void setGameCharacters(List<String> characters) {
    gameCharacters.assignAll(characters);
  }

  bool get areAllSelectedHiragana {
    if (selectedCharacters.isEmpty) return false;
    return selectedCharacters.every((char) => isHiragana(char));
  }

  bool get areAllSelectedKatakana {
    if (selectedCharacters.isEmpty) return false;
    return selectedCharacters.every((char) => isKatakana(char));
  }
}
