import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/ui/pages/admin_panel/admin_panel_page.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_flow_page.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class VocabPage extends StatelessWidget {
  const VocabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final dataRepo = Get.find<JapaneseDataRepository>();

    return Scaffold(
      backgroundColor: AppColors.backgroundDark, // background-dark
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark.withValues(alpha: 0.8),
        elevation: 0,
        title: Text(
          "Vocabulary",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () => Get.to(() => AdminPanelPage()),
            icon: const Icon(Icons.admin_panel_settings_outlined),
            splashRadius: 20,
            tooltip: 'Admin Panel',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(() {
        // Show loading state
        if (dataRepo.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  'Loading vocabulary lessons...',
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Show error state
        if (dataRepo.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading lessons',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    dataRepo.errorMessage.value,
                    style: GoogleFonts.inter(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => dataRepo.refreshAll(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        }

        // Build lesson list with FutureBuilder
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: dataRepo.getVocabularyLessons(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            final vocabLessons = snapshot.data!;

            return Stack(
              children: [
                // Background decorative path - simplified
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 40,
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.1),
                          AppColors.primary.withValues(alpha: 0.5),
                          AppColors.primary.withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  itemCount: vocabLessons.length,
                  itemBuilder: (context, index) {
                    // Calculate total chunks for this lesson
                    final lessonData = vocabLessons[index];
                    final totalWords = lessonData.length;
                    const chunkSize = 5;
                    final totalChunks = (totalWords / chunkSize).ceil();

                    // Get completed chunks for this lesson
                    final completedChunks = userController
                            .finishedChunks[index.toString()]?.length ??
                        0;

                    // Calculate progress
                    final progress =
                        totalChunks > 0 ? completedChunks / totalChunks : 0.0;

                    // Determine status
                    String status;
                    if (progress >= 1.0) {
                      status = 'completed';
                    } else {
                      status = 'in-progress';
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: LessonCard(
                        lessonNumber: index + 1,
                        status: status,
                        progress: progress,
                        onTap: () {
                          Get.to(LessonFlowPage(lessonIndex: index));
                        },
                      ),
                    );
                  },
                )
              ],
            );
          },
        );
      }),
    );
  }
}

// A new widget for the lesson card
class LessonCard extends StatelessWidget {
  final int lessonNumber;
  final String status; // 'completed', 'in-progress', 'locked'
  final double progress;
  final VoidCallback? onTap;

  const LessonCard({
    Key? key,
    required this.lessonNumber,
    required this.status,
    this.progress = 0.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLocked = status == 'locked';
    bool isInProgress = status == 'in-progress';

    Widget cardContent = Material(
      color: AppColors.cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Opacity(
          opacity: isLocked ? 0.7 : 1.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                _buildIcon(),
                const SizedBox(width: 16),
                Expanded(child: _buildTitleAndSubtitle()),
                Icon(
                  Icons.chevron_right,
                  color: isLocked
                      ? Colors.grey[600]!
                      : isInProgress
                          ? AppColors.primary
                          : Colors.grey[600]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (isInProgress) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: cardContent,
      );
    }

    return cardContent;
  }

  Widget _buildIcon() {
    IconData iconData;
    Color iconColor;
    Color bgColor;

    switch (status) {
      case 'completed':
        iconData = Icons.menu_book_rounded;
        iconColor = AppColors.primary;
        bgColor = AppColors.primary.withValues(alpha: 0.1);
        break;
      case 'in-progress':
        iconData = Icons.play_arrow_rounded;
        iconColor = Colors.white;
        bgColor = AppColors.primary;
        break;
      case 'locked':
      default:
        iconData = Icons.lock_rounded;
        iconColor = Colors.grey[600]!;
        bgColor = Colors.grey.shade800;
        break;
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: status == 'in-progress'
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Icon(iconData, color: iconColor),
    );
  }

  Widget _buildTitleAndSubtitle() {
    String subtitleText;
    Color subtitleColor;

    switch (status) {
      case 'completed':
        subtitleText = 'Completed';
        subtitleColor = AppColors.primary;
        break;
      case 'in-progress':
        subtitleText = 'In Progress • ${(progress * 100).toInt()}%';
        subtitleColor = AppColors.textSlate400;
        break;
      case 'locked':
      default:
        subtitleText = 'Locked';
        subtitleColor = AppColors.textSlate400;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lesson $lessonNumber',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitleText,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}
