import 'package:flutter/foundation.dart';

/// A model representing a single vocabulary item.
///
/// This class is designed to be immutable.
@immutable
class VocabularyModel {
  final String japanese;
  final String burmese;
  final String romaji;
  final String exampleSentence;
  final String exampleSentenceTranslation;
  final String? imageUrl;

  const VocabularyModel({
    required this.japanese,
    required this.burmese,
    required this.romaji,
    required this.exampleSentence,
    required this.exampleSentenceTranslation,
    this.imageUrl,
  });

  /// Creates a [VocabularyModel] from a MapEntry, which is the
  /// current data structure for lessons in the app.
  ///
  /// The map entry is expected to have a String key for the Burmese translation,
  /// and a List of dynamic values containing other details.
  factory VocabularyModel.fromMapEntry(MapEntry<String, List<dynamic>> entry) {
    String clean(String input) => input
        .replaceAll("～", "")
        .replaceAll("~", "")
        .replaceAll("〜", "")
        .replaceAll("「", "")
        .replaceAll("」", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("、", "")
        .replaceAll("・", "")
        .replaceAll(" ", "")
        .trim();

    return VocabularyModel(
      burmese: clean(entry.key),
      japanese: entry.value.isNotEmpty ? clean(entry.value[0] as String) : '',
      romaji: entry.value.length > 1 ? entry.value[1] as String : '',
      exampleSentence: clean(entry.value.last.toString().split('\n').first),
      exampleSentenceTranslation:
          clean(entry.value.last.toString().split('\n').last),
      imageUrl: entry.value.length > 3 ? entry.value[3] as String? : null,
    );
  }

  @override
  String toString() {
    return 'VocabularyModel(japanese: $japanese, burmese: $burmese, romaji: $romaji, exampleSentence: $exampleSentence, exampleSentenceTranslation: $exampleSentenceTranslation, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VocabularyModel &&
        other.japanese == japanese &&
        other.burmese == burmese &&
        other.romaji == romaji &&
        other.exampleSentence == exampleSentence &&
        other.exampleSentenceTranslation == exampleSentenceTranslation &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return japanese.hashCode ^
        burmese.hashCode ^
        romaji.hashCode ^
        exampleSentence.hashCode ^
        exampleSentenceTranslation.hashCode ^
        imageUrl.hashCode;
  }
}
