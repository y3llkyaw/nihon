import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_training_page.dart';

class LessonReviewPage extends StatelessWidget {
  final Map<String, List<String>> lesson;
  final int lessonNumber;

  const LessonReviewPage({
    Key? key,
    required this.lesson,
    required this.lessonNumber,
  }) : super(key: key);

  // Colors from the design
  static const Color backgroundDark = Color(0xFF0B1622);
  static const Color cardBackground = Color(0xFF172835);
  static const Color textWhite = Colors.white;
  static const Color primary = Color(0xFF3BA8FC);
  static const Color textSlate700 = Color(0xFF334155);

  @override
  Widget build(BuildContext context) {
    final words = lesson.entries.take(5).toList();

    return Scaffold(
      backgroundColor: backgroundDark,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: backgroundDark.withValues(alpha: 0.8),
                elevation: 0,
                pinned: true,
                leading: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: cardBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: textSlate700.withValues(
                              alpha: 0.5)), // border-slate-700/50
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: textWhite, size: 20),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                // Title removed to match lesson_flow_page design
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child:
                        Icon(Icons.workspace_premium_rounded, color: primary),
                  ),
                ],
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                        child: Column(
                          children: [
                            Text(
                              '${words.length} Words for Today',
                              style: GoogleFonts.lexend(
                                color: textWhite,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Hiragana Basics • Unit $lessonNumber',
                              style: GoogleFonts.lexend(
                                color: textWhite.withValues(alpha: 0.4),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...words.map((word) => _buildWordCard(word)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40), // pb-10
                        child: SizedBox(
                          width: double.infinity, // w-full
                          child: ElevatedButton(
                            onPressed: () {
                              // print(words[0].value[0]);
                              Get.to(() => LessonTrainingPage(lesson: words));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: textWhite, // bg-white
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20), // py-5
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(9999), // rounded-full
                              ),
                              shadowColor: Colors.black
                                  .withValues(alpha: .4), // shadow-xl
                              elevation: 10, // Approximate shadow-xl
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.lexend(
                                fontSize: 18, // text-xl
                                fontWeight: FontWeight.bold,
                                color: backgroundDark, // text-background-dark
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWordCard(MapEntry<String, List<String>> word) {
    final japanese = word.value[0];
    // final kenji = word.value[1];
    final meaning = word.key.toLowerCase();

    final TtsController ttsController = TtsController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Material(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            await ttsController.speak(japanese);
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: textWhite.withValues(alpha: 0.05)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      japanese,
                      style: GoogleFonts.notoSansJp(
                        color: textWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ' $meaning',
                      style: GoogleFonts.lexend(
                        color: textWhite.withValues(alpha: 0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: textWhite.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon:
                        const Icon(Icons.volume_up_outlined, color: textWhite),
                    onPressed: () async {
                      await ttsController.speak(japanese);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
