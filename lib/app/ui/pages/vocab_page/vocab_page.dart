import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/lesson_flow_page.dart';

class VocabPage extends StatelessWidget {
  const VocabPage({Key? key}) : super(key: key);

  // Define colors from the design
  static const Color backgroundDark = Color(0xFF101C22);
  static const Color cardDark = Color(0xFF1A272E);
  static const Color primary = Color(0xFF2BADEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101C22), // background-dark
      appBar: AppBar(
        backgroundColor: const Color(0xFF101C22).withValues(alpha: 0.8),
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
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
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
                    primary.withValues(alpha: 0.1),
                    primary.withValues(alpha: 0.5),
                    primary.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            itemCount: vocabLessons.length,
            itemBuilder: (context, index) {
              // Mocking lesson states based on index
              String status;
              double progress = 0.0;
              if (index == 0) {
                status = 'completed';
              } else if (index == 1) {
                status = 'in-progress';
                progress = 0.4;
              } else {
                status = 'locked';
              }
              status = 'in-progress';

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LessonCard(
                  lessonNumber: index + 1,
                  status: status,
                  progress: progress,
                  onTap: status != 'locked'
                      ? () {
                          Get.to(LessonFlowPage(lessonIndex: index));
                          // Get.toNamed(
                          //   "${AppRoutes.VOCABULARY}${AppRoutes.VOCAB_LESSON}"
                          //       .replaceFirst(':lesson', '${index + 1}'),
                          // );
                        }
                      : null,
                ),
              );
            },
          ),
        ],
      ),
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

  static const Color cardDark = Color(0xFF1A272E);
  static const Color primary = Color(0xFF2BADEE);
  static final Color textSlate400 = Colors.grey[400]!;
  static final Color textSlate600 = Colors.grey[600]!;

  @override
  Widget build(BuildContext context) {
    bool isLocked = status == 'locked';
    bool isInProgress = status == 'in-progress';

    Widget cardContent = Material(
      color: cardDark,
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
                      ? textSlate600
                      : isInProgress
                          ? primary
                          : textSlate600,
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
        iconColor = primary;
        bgColor = primary.withValues(alpha: 0.1);
        break;
      case 'in-progress':
        iconData = Icons.play_arrow_rounded;
        iconColor = Colors.white;
        bgColor = primary;
        break;
      case 'locked':
      default:
        iconData = Icons.lock_rounded;
        iconColor = textSlate600;
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
                  color: primary.withValues(alpha: 0.3),
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
        subtitleColor = primary;
        break;
      case 'in-progress':
        subtitleText = 'In Progress • ${(progress * 100).toInt()}%';
        subtitleColor = textSlate400;
        break;
      case 'locked':
      default:
        subtitleText = 'Locked';
        subtitleColor = textSlate400;
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
