import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Using colors consistent with lesson_flow_page.dart
const Color primary = Color(0xFF3BA8FC);
const Color cardDark = Color(0xFF172835);
const Color textWhite = Colors.white;

class MatchingWidget extends StatefulWidget {
  const MatchingWidget({Key? key}) : super(key: key);

  @override
  State<MatchingWidget> createState() => _MatchingWidgetState();
}

class _MatchingWidgetState extends State<MatchingWidget> {
  int? selectedAudioIndex;
  int? selectedCharacterIndex;

  final List<String> characters = ['あ', 'い', 'う', 'え'];

  @override
  void initState() {
    super.initState();
    // Mocking the initial state from the HTML to demonstrate styling
    selectedAudioIndex = 0;
    selectedCharacterIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return _AudioButton(
                index: index,
                isSelected: selectedAudioIndex == index,
                onTap: () => setState(() => selectedAudioIndex = index),
              );
            }),
          ),
          // Character buttons column
          Padding(
            padding: const EdgeInsets.only(top: 8.0), // pt-2 from HTML parent
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return _CharacterCard(
                  character: characters[index],
                  isSelected: selectedCharacterIndex == index,
                  onTap: () => setState(() => selectedCharacterIndex = index),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _AudioButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _AudioButton(
      {required this.index, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 80,
            height: 80,
            decoration: isSelected
                ? BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  )
                : BoxDecoration(
                    color: cardDark,
                    shape: BoxShape.circle,
                    border: Border.all(color: textWhite.withValues(alpha: 0.1)),
                  ),
            child: Icon(
              Icons.volume_up,
              color: isSelected ? textWhite : textWhite.withValues(alpha: 0.8),
              size: 36,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "AUDIO ${index + 1}",
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
  final VoidCallback onTap;

  const _CharacterCard(
      {required this.character, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? primary.withValues(alpha: 0.1) : cardDark,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? primary : textWhite.withValues(alpha: 0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            character,
            style: GoogleFonts.notoSansJp(
              color: textWhite,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
