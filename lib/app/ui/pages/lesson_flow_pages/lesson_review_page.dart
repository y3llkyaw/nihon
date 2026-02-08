import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_training_page.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class LessonReviewPage extends StatelessWidget {
  final int lessonNumber;
  final List<VocabularyModel> chunk;
  final int chunkIndex;

  const LessonReviewPage({
    Key? key,
    required this.chunk,
    required this.lessonNumber,
    this.chunkIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = chunk;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor:
                    AppColors.backgroundDark.withValues(alpha: 0.8),
                elevation: 0,
                pinned: true,
                leading: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.cardDark,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.textSlate700.withValues(alpha: 0.5),
                      ), // border-slate-700/50
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textWhite, size: 20),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                // Title removed to match lesson_flow_page design
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Icon(Icons.workspace_premium_rounded,
                        color: AppColors.primary),
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
                                color: AppColors.textWhite,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Hiragana Basics • Unit $lessonNumber',
                              style: GoogleFonts.lexend(
                                color:
                                    AppColors.textWhite.withValues(alpha: 0.4),
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
                              Get.to(
                                () => LessonTrainingPage(
                                  lesson: words,
                                  lessonIndex: lessonNumber - 1,
                                  chunkIndex: chunkIndex,
                                ),
                                transition: Transition.rightToLeft,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.textWhite, // bg-white
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
                                color: AppColors
                                    .backgroundDark, // text-background-dark
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

  Widget _buildWordCard(VocabularyModel word) {
    final japanese = word.japanese;
    final meaning = word.burmese.toLowerCase();

    final TtsController ttsController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Material(
        color: AppColors.cardDark,
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
              border: Border.all(
                  color: AppColors.textWhite.withValues(alpha: 0.05)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        japanese,
                        style: GoogleFonts.notoSansJp(
                          color: AppColors.textWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ' $meaning',
                        style: GoogleFonts.lexend(
                          color: AppColors.textWhite.withValues(alpha: 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.textWhite.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.volume_up_outlined,
                        color: AppColors.textWhite),
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
