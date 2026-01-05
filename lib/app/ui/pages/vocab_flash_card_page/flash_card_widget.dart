import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// Assuming this controller exists in your project structure
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';

class FlashCardWidget extends StatelessWidget {
  FlashCardWidget({
    Key? key,
    // number is not used in this specific card design face
    this.number,
    required this.image,
    // hiragana is not the main focus here, using kenji for the big character
    this.hiragana,
    required this.kenji,
    required this.romaji,
    required this.meaning,
    required this.onClick,
    required this.example,
    required this.exampleMeaning, // Added parameter for English example translation
    this.isImageShow = true,
    this.onAudioTap, // Added callback for audio icon
  }) : super(key: key);

  final String image;
  final bool isImageShow;
  final int? number;
  final String meaning;
  final String romaji;
  final String? hiragana;
  final String kenji;
  final VoidCallback? onClick;
  final VoidCallback? onAudioTap;
  final String example;
  final String exampleMeaning;

  // Keeping the controller injection if you need it for other logic,
  // but removed the Obx and animations to match the static design image purely.
  final flashCardPageController = Get.put(VocabFlashCardPageController());

  // Define colors locally to match the image if theme colors aren't exact.
  // Replace these with your theme colors if you have a dark theme set up.
  final Color _cardBackgroundColor = const Color(0xFF1E1E1E);
  final Color _exampleBoxColor = const Color(0xFF2C2C2C);
  final Color _romajiColor = const Color(0xFF4A90E2);
  final Color _textColorWhite = Colors.white;
  final Color _textColorGrey = Colors.grey;

  final fcc = Get.find<VocabFlashCardPageController>();
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery for responsive sizing instead of fixed Get.width/height percentages
    final size = MediaQuery.of(context).size;
    final cardWidth = size.width * 0.85;
    // Calculate height roughly based on the aspect ratio in the image, or let content define it.
    // Using a constrained height here for consistency with the original code's intent.
    final cardHeight = size.height * 0.6;

    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onClick,
        child: Container(
          width: cardWidth,
          // Allowing height to grow if content needs it, but setting a minimum
          constraints: BoxConstraints(minHeight: cardHeight),
          decoration: BoxDecoration(
            color: _cardBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: _exampleBoxColor,
                child: Text(number.toString()),
              ),
              Spacer(),
              // --- Image Section with Gradient and Audio Icon ---
              if (isImageShow)
                Stack(
                  children: [
                    // The Image itself
                    SizedBox(
                      width: double.infinity,
                      height: 220, // Fixed height for the image area
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Gradient Overlay to fade image into background
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              _cardBackgroundColor.withOpacity(0.1),
                              _cardBackgroundColor,
                            ],
                            stops: const [0.5, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),
                    // Audio Icon Button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: InkWell(
                        onTap: onAudioTap,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.speaker_2_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // --- Main Content Section ---
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    // Kanji (Big White Text)
                    Text(
                      hiragana != null && hiragana!.isNotEmpty
                          ? hiragana!
                          : kenji,
                      style: GoogleFonts.notoSansJavanese(
                        // Using a Japanese font
                        color: _textColorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        height: 1.0, // Tighten line height
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // Romaji (Blue Text)
                    Obx(
                      () => AnimatedOpacity(
                        opacity: fcc.isRomajiShown.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          romaji,
                          style: GoogleFonts.roboto(
                            color: _romajiColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Meaning (Grey Text)
                    Obx(
                      () => AnimatedOpacity(
                        opacity: fcc.isMeaningShown.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          meaning,
                          style: GoogleFonts.roboto(
                            color: _textColorGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Small Divider Line
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _exampleBoxColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- Example Box ---
                    Column(
                      children: [
                        InkWell(
                          onTap: onAudioTap,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _exampleBoxColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Example Header
                                Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      CupertinoIcons.book_fill,
                                      color: _romajiColor,
                                      size: 18,
                                    ),
                                    Text(
                                      "EXAMPLE",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: _textColorGrey,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Colors.white.withValues(alpha: 0.3),
                                      child: Icon(
                                        Icons.volume_up,
                                        color: _romajiColor,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                // Japanese Sentence
                                Text(
                                  example,
                                  style: GoogleFonts.notoSansJavanese(
                                    fontSize: 18,
                                    color: _textColorWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  exampleMeaning,
                                  style: GoogleFonts.notoSansJavanese(
                                    fontSize: 14,
                                    color: _textColorWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
