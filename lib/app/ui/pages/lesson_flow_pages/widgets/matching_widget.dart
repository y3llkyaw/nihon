import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';

// Using colors consistent with lesson_flow_page.dart
const Color primary = Color(0xFF3BA8FC);
const Color cardDark = Color(0xFF172835);
const Color textWhite = Colors.white;

class MatchingWidget extends StatefulWidget {
  final Map<String, String> lesson;
  final VoidCallback onAllMatched;

  const MatchingWidget({
    Key? key,
    required this.lesson,
    required this.onAllMatched,
  }) : super(key: key);

  @override
  State<MatchingWidget> createState() => _MatchingWidgetState();
}

class _MatchingWidgetState extends State<MatchingWidget> {
  final vtc = Get.put(VocabTrainingController());
  final tts = Get.put(TtsController());

  late final List<String> audioItems;
  late final List<String> characterItems;

  @override
  void initState() {
    super.initState();
    final controllerLesson =
        widget.lesson.map((key, value) => MapEntry(key, [value]));
    vtc.lesson.clear();
    vtc.doneList.clear();
    vtc.selectedBuremese.value = '';
    vtc.selectedJapanese.value = '';
    vtc.point.value = 0;
    vtc.heartLeft.value = 5;
    vtc.lesson.addAll(controllerLesson);

    audioItems = widget.lesson.keys.toList()..shuffle();
    characterItems = widget.lesson.values.toList()..shuffle();

    ever(vtc.doneList, (List<dynamic> done) {
      if (done.length >= widget.lesson.length * 2) {
        widget.onAllMatched();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: audioItems.map((audioKey) {
              return _AudioButton(
                label: audioKey,
                isSelected: vtc.selectedBuremese.value == audioKey,
                isMatched: vtc.doneList.contains(audioKey),
                onTap: () {
                  final characterToSpeak = vtc.lesson[audioKey]![0];
                  tts.speak(characterToSpeak);
                  vtc.selectBurmese(audioKey, context);
                },
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: characterItems.map((character) {
              return _CharacterCard(
                character: character,
                isSelected: vtc.selectedJapanese.value == character,
                isMatched: vtc.doneList.contains(character),
                onTap: () {
                  tts.speak(character);
                  vtc.selectJapanese(character, context);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _AudioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isMatched;
  final VoidCallback onTap;

  const _AudioButton(
      {required this.label,
      required this.isSelected,
      required this.isMatched,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isMatched ? null : onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSelected
                  ? primary
                  : isMatched
                      ? Colors.green.withValues(alpha: 0.5)
                      : cardDark,
              shape: BoxShape.circle,
              border: isMatched
                  ? null
                  : Border.all(color: textWhite.withValues(alpha: 0.1)),
            ),
            child: Icon(
              Icons.volume_up,
              color: isSelected || isMatched
                  ? textWhite
                  : textWhite.withValues(alpha: 0.8),
              size: 36,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: GoogleFonts.lexend(
              color: isSelected ? primary : textWhite.withValues(alpha: 0.2),
              fontSize: 10,
              fontWeight: FontWeight.w900, // font-black
              letterSpacing: 1.2, // tracking-wider
            ),
          )
        ],
      ),
    );
  }
}

class _CharacterCard extends StatelessWidget {
  final String character;
  final bool isSelected;
  final bool isMatched;
  final VoidCallback onTap;

  const _CharacterCard(
      {required this.character,
      required this.isSelected,
      required this.isMatched,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isMatched ? null : onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? primary.withValues(alpha: 0.1)
              : isMatched
                  ? Colors.green.withValues(alpha: 0.5)
                  : cardDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            character,
            style: GoogleFonts.notoSansJp(
              color: textWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
