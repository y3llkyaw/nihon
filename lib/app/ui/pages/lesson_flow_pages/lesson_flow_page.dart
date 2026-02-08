import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming GetX is used for navigation or other purposes
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_review_page.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class LessonFlowPage extends StatelessWidget {
  LessonFlowPage({Key? key, required this.lessonIndex}) : super(key: key);

  final int lessonIndex;

  final LessonTrainningPageController lessonTrainningPageController =
      Get.put(LessonTrainningPageController());

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    lessonTrainningPageController.lesson.value = lessonIndex;
    lessonTrainningPageController.finished.value = 0;
    lessonTrainningPageController.widgetList.clear();

    final lessonData = vocabLessons[lessonIndex];
    final lessonModels =
        lessonData.entries.map((e) => VocabularyModel.fromMapEntry(e)).toList();

    final List<List<VocabularyModel>> chunkedEntries = [];
    for (var i = 0; i < lessonModels.length; i += 4) {
      chunkedEntries.add(lessonModels.sublist(
          i, i + 4 > lessonModels.length ? lessonModels.length : i + 4));
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 48, bottom: 16), // p-6 pt-12
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(9999), // rounded-full
                    border: Border.all(
                        color: AppColors.textSlate700
                            .withValues(alpha: .5)), // border-slate-700/50
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textWhite, size: 20),
                    onPressed: () {
                      Get.back(); // Assuming GetX for navigation
                    },
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.workspace_premium_rounded,
                        color: AppColors.primary),
                  ],
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: SingleChildScrollView(
              // Added SingleChildScrollView for potential overflow
              padding: const EdgeInsets.symmetric(horizontal: 24), // px-6
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Lesson Info Section
                  Container(
                    margin:
                        const EdgeInsets.only(top: 16, bottom: 32), // mt-4 mb-8
                    child: Column(
                      children: [
                        Container(
                          width: 96, // w-24
                          height: 96, // h-24
                          margin: const EdgeInsets.only(bottom: 24), // mb-6
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(24), // rounded-3xl
                            color: AppColors.primary
                                .withValues(alpha: .1), // bg-primary/10
                            border: Border.all(
                                color: AppColors.primary.withValues(alpha: .2),
                                width: 2), // border-2 border-primary/20
                          ),
                          child: const Icon(Icons.inventory_2_rounded,
                              color: AppColors.primary, size: 48), // text-5xl
                        ),
                        Text(
                          'Lesson ${lessonIndex + 1}',
                          style: GoogleFonts.lexend(
                            fontSize: 28, // text-3xl
                            fontWeight: FontWeight.bold,
                            color: AppColors.textWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8), // mb-2
                        Text(
                          "You'll learn ${lessonData.length} words",
                          style: GoogleFonts.lexend(
                            fontSize: 18, // text-lg
                            fontWeight: FontWeight.w300, // font-light
                            color: AppColors.textSlate400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Action Buttons Section
                  Container(
                    margin: const EdgeInsets.only(bottom: 20), // mb-10
                    child: GridView.count(
                      shrinkWrap: true, // Important for GridView inside Column
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                      crossAxisCount: 4,
                      mainAxisSpacing: 8, // gap-2
                      crossAxisSpacing: 8, // gap-2
                      childAspectRatio:
                          0.75, // Adjust as needed to match aspect ratio of HTML cards
                      children: [
                        _buildActionButton(Icons.hearing_rounded, 'Listen'),
                        _buildActionButton(Icons.edit_rounded, 'Write'),
                        _buildActionButton(Icons.visibility_rounded, 'Read'),
                        _buildActionButton(Icons.emoji_events_rounded, 'Quiz'),
                      ],
                    ),
                  ),

                  // Progress Bar Section
                  Container(
                    margin: const EdgeInsets.only(bottom: 24), // mb-12
                    padding: const EdgeInsets.all(24), // p-6
                    decoration: BoxDecoration(
                      color: AppColors.cardDark
                          .withValues(alpha: .4), // bg-card-dark/40
                      borderRadius: BorderRadius.circular(24), // rounded-3xl
                      border: Border.all(
                          color: AppColors.textSlate700.withValues(
                              alpha: .2)), // border border-slate-700/20
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Progress',
                                  style: GoogleFonts.roboto(
                                    fontSize: 10, // text-xs
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                    letterSpacing: 1.5, // tracking-widest
                                  ),
                                ),
                                const SizedBox(height: 4), // gap-1
                                Text(
                                  'Words learned',
                                  style: GoogleFonts.lexend(
                                    fontSize: 18, // text-xl
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                text: '0 ',
                                style: GoogleFonts.lexend(
                                  fontSize: 24, // text-2xl
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textWhite,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/ ${lessonData.length}',
                                    style: GoogleFonts.lexend(
                                      fontSize: 18, // text-lg
                                      fontWeight:
                                          FontWeight.normal, // font-normal
                                      color: AppColors.textSlate500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16), // mb-4
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 16, // h-4
                          width: double.infinity, // w-full
                          decoration: BoxDecoration(
                            color: AppColors.textSlate800, // bg-slate-800
                            borderRadius:
                                BorderRadius.circular(9999), // rounded-full
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.05, // style="width: 5%;"
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary, // bg-primary
                                borderRadius:
                                    BorderRadius.circular(9999), // rounded-full
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.4),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  CarouselSlider(
                    items: chunkedEntries.map((chunk) {
                      return InkWell(
                        radius: 40,
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          Get.to(LessonReviewPage(
                            chunk: chunk,
                            lessonNumber: lessonIndex + 1,
                            chunkIndex: chunkedEntries.indexOf(chunk),
                          ));
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: 20,
                            backgroundColor: userController.finishedChunks[
                                            lessonIndex.toString()] !=
                                        null &&
                                    userController
                                        .finishedChunks[lessonIndex.toString()]!
                                        .contains(chunkedEntries.indexOf(chunk))
                                ? AppColors.primary
                                : AppColors.cardDark,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '${chunkedEntries.indexOf(chunk) + 1}',
                                  style: GoogleFonts.lexend(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    // color: AppColors.backgroundDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      aspectRatio: 16 / 2,
                      viewportFraction: 0.2,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Start Lesson Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40), // pb-10
                    child: SizedBox(
                      width: double.infinity, // w-full
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle start lesson
                          final completedChunks = userController
                                  .finishedChunks[lessonIndex.toString()] ??
                              [];
                          int nextChunkIndex = 0;
                          for (int i = 0; i < chunkedEntries.length; i++) {
                            if (!completedChunks.contains(i)) {
                              nextChunkIndex = i;
                              break;
                            }
                          }
                          Get.to(LessonReviewPage(
                            chunk: chunkedEntries[nextChunkIndex],
                            lessonNumber: 1 + lessonIndex,
                            chunkIndex: nextChunkIndex,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textWhite, // bg-white
                          padding:
                              const EdgeInsets.symmetric(vertical: 20), // py-5
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(9999), // rounded-full
                          ),
                          shadowColor:
                              Colors.black.withValues(alpha: .4), // shadow-xl
                          elevation: 10, // Approximate shadow-xl
                        ),
                        child: Text(
                          'Start Lesson',
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
      // Bottom Navigation
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Handle action button tap
      },
      borderRadius: BorderRadius.circular(16), // rounded-2xl
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 12), // p-3 py-4
        decoration: BoxDecoration(
          color: AppColors.cardDark, // bg-card-dark
          borderRadius: BorderRadius.circular(16), // rounded-2xl
          border: Border.all(
              color: AppColors.textSlate700
                  .withValues(alpha: .3)), // border border-slate-700/30
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40, // w-10
              height: 40, // h-10
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999), // rounded-full
                color: AppColors.primary.withValues(alpha: .2), // bg-primary/20
              ),
              child: Icon(icon, color: AppColors.primary, size: 24), // text-xl
            ),
            const SizedBox(height: 12), // gap-3
            Text(
              label.toUpperCase(),
              style: GoogleFonts.lexend(
                fontSize: 10, // text-[10px]
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
                letterSpacing: 1.2, // tracking-wider
              ),
            ),
          ],
        ),
      ),
    );
  }
}
