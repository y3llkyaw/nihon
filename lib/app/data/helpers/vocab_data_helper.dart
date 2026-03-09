/// Helper class that parses raw vocabulary Map entries into display-ready fields.
/// Eliminates duplicated parsing logic across VocabFlashCardPage,
/// StarredFlashCardPage, and LessonFlowPage.
class VocabDisplayData {
  final String meaning;
  final String hiragana;
  final String kanji;
  final String romaji;
  final String imageUrl;
  final String example;
  final String exampleMeaning;

  VocabDisplayData({
    required this.meaning,
    required this.hiragana,
    required this.kanji,
    required this.romaji,
    required this.imageUrl,
    required this.example,
    required this.exampleMeaning,
  });

  /// Creates display data from a raw vocab Map entry (key = Burmese meaning,
  /// value = [hiragana, kanji, romaji, imageUrl, exampleSentence]).
  factory VocabDisplayData.fromEntry(MapEntry<String, dynamic> entry) {
    final valueList = List<dynamic>.from(entry.value as List);
    final exampleParts =
        valueList.length > 4 ? valueList[4].toString().split('\n') : [''];

    return VocabDisplayData(
      meaning: entry.key.split('\n')[0],
      hiragana: valueList.isNotEmpty ? valueList[0].toString() : '',
      kanji: valueList.length > 1 ? valueList[1].toString() : '',
      romaji: valueList.length > 2 ? valueList[2].toString() : '',
      imageUrl: valueList.length > 3 ? valueList[3].toString() : '',
      example: exampleParts.isNotEmpty ? exampleParts[0] : '',
      exampleMeaning: exampleParts.length > 1
          ? exampleParts[1].replaceAll("(", "").replaceAll(")", "")
          : '',
    );
  }
}
