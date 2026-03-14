import 'package:hiragana/app/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// Assuming this controller exists in your project structure
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';

class FlashCardWidget extends StatefulWidget {
  FlashCardWidget({
    Key? key,
    this.number,
    required this.image,
    this.hiragana,
    required this.kenji,
    required this.romaji,
    required this.meaning,
    required this.onClick,
    required this.example,
    required this.exampleMeaning,
    this.isImageShow = true,
    this.onAudioTap,
    this.isStarred = false,
    this.onStarTap,
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
  final bool isStarred;
  final VoidCallback? onStarTap;

  @override
  State<FlashCardWidget> createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  final fcc = Get.find<VocabFlashCardPageController>();
  bool _isAnswerRevealedLocal = false;

  final Color _cardBackgroundColor = AppColors.backgroundDark;
  final Color _exampleBoxColor = AppColors.cardDark;
  final Color _romajiColor = AppColors.primary;
  final Color _textColorWhite = Colors.white;
  final Color _textColorGrey = Colors.grey;

  @override
  void didUpdateWidget(covariant FlashCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset local state if the underlying card content changes
    if (oldWidget.kenji != widget.kenji) {
      setState(() {
        _isAnswerRevealedLocal = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardWidth = size.width * 0.85;
    final cardHeight = size.height * 0.6;

    // React to global hide changes from Quiz mode by resetting local state
    // We use Ever/Obx inside build implicitly through fcc observables

    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onClick,
        child: Container(
          width: cardWidth,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: _exampleBoxColor,
                      child: Text(widget.number.toString()),
                    ),
                    InkWell(
                      onTap: widget.onStarTap,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.isStarred
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          color:
                              widget.isStarred ? Colors.amber : Colors.white70,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // if (widget.isImageShow || _isAnswerRevealedLocal)
              //   Stack(
              //     children: [
              //       SizedBox(
              //         width: double.infinity,
              //         height: 220,
              //         child: Image.network(
              //           widget.image,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       Positioned.fill(
              //         child: DecoratedBox(
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.transparent,
              //                 _cardBackgroundColor.withOpacity(0.1),
              //                 _cardBackgroundColor,
              //               ],
              //               stops: const [0.5, 0.7, 1.0],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         top: 16,
              //         right: 16,
              //         child: InkWell(
              //           onTap: widget.onAudioTap,
              //           borderRadius: BorderRadius.circular(30),
              //           child: Container(
              //             padding: const EdgeInsets.all(8),
              //             decoration: BoxDecoration(
              //               color: Colors.black.withValues(alpha: 0.5),
              //               shape: BoxShape.circle,
              //             ),
              //             child: const Icon(
              //               CupertinoIcons.speaker_2_fill,
              //               color: Colors.white,
              //               size: 20,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      widget.hiragana != null && widget.hiragana!.isNotEmpty
                          ? widget.hiragana!
                          : widget.kenji,
                      style: GoogleFonts.notoSansJavanese(
                        color: _textColorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => AnimatedOpacity(
                        opacity:
                            fcc.isRomajiShown.value || _isAnswerRevealedLocal
                                ? 1.0
                                : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          widget.romaji,
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
                    Obx(
                      () => AnimatedOpacity(
                        opacity:
                            fcc.isMeaningShown.value || _isAnswerRevealedLocal
                                ? 1.0
                                : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          widget.meaning,
                          style: GoogleFonts.roboto(
                            color: _textColorGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      if (fcc.isQuizMode.value &&
                          !fcc.isMeaningShown.value &&
                          !_isAnswerRevealedLocal) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isAnswerRevealedLocal = true;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye_rounded,
                                size: 18),
                            label: const Text("Show Answer"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _exampleBoxColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        InkWell(
                          onTap: widget.onAudioTap,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _exampleBoxColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Text(
                                  widget.example,
                                  style: GoogleFonts.notoSansJavanese(
                                    fontSize: 18,
                                    color: _textColorWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 4),
                                Obx(
                                  () => AnimatedOpacity(
                                    opacity: fcc.isMeaningShown.value ||
                                            _isAnswerRevealedLocal
                                        ? 1.0
                                        : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Text(
                                      widget.exampleMeaning,
                                      style: GoogleFonts.notoSansJavanese(
                                        fontSize: 14,
                                        color: _textColorWhite,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
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
