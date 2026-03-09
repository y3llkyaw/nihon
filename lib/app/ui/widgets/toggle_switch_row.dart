import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable Switch + Label row, used in VocabFlashCardPage for toggling
/// visibility of meaning, romaji, images, and example sentences.
class ToggleSwitchRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  const ToggleSwitchRow({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: GoogleFonts.notoSansJavanese(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
