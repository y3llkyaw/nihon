import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

/// Full-width rounded action button used across lesson flow and review pages.
class PrimaryActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.textWhite,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
          ),
          shadowColor: Colors.black.withValues(alpha: .4),
          elevation: 10,
        ),
        child: Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor ?? AppColors.backgroundDark,
          ),
        ),
      ),
    );
  }
}
