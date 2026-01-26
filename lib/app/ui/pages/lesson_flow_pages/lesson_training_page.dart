import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/widgets/burmese_to_japanese_widget.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/widgets/fill_in_the_blank_widget.dart';
import 'package:hiragana/app/ui/pages/lesson_flow_pages/widgets/typing_quiz_item.dart';

class LessonTrainingPage extends StatefulWidget {
  const LessonTrainingPage({Key? key, required this.lesson}) : super(key: key);

  // Define colors from the new design
  static const Color primary = Color(0xFF0D8FF2);
  static const Color backgroundDark = Color(0xFF0A0C10);
  static const Color textWhite = Colors.white;
  final lesson;

  @override
  State<LessonTrainingPage> createState() => _LessonTrainingPageState();
}

class _LessonTrainingPageState extends State<LessonTrainingPage> {
  final CarouselSliderController csc = CarouselSliderController();

  final LessonTrainningPageController controller = Get.find();

  @override
  void initState() {
    final m2jpossibleAnswer = widget.lesson.map((e) => e.value[0]).toList();
    m2jpossibleAnswer.shuffle();
    final j2mpossibleAnswer = widget.lesson.map((e) => e.key).toList();
    j2mpossibleAnswer.shuffle();

    widget.lesson.forEach((entry) {
      controller.widgetList
          .add(buildBurmeseToJapaneseQuizItem(entry, csc, m2jpossibleAnswer));
    });
    widget.lesson.forEach((entry) {
      controller.widgetList.add(
        buildBurmeseToJapaneseQuizItem(entry, csc, j2mpossibleAnswer,
            isJapaneseToBurmese: true),
      );
    });
    widget.lesson.forEach((entry) {
      controller.widgetList.add(buildTypingQuizItem(entry.value[0], csc));
    });
    widget.lesson.forEach((entry) {
      controller.widgetList.add(fillInBlankWidgets(entry, csc));
    });

    super.initState();
  }

  Future<bool> _showExitConfirmDialog() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        backgroundColor: LessonTrainingPage.backgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
              color: LessonTrainingPage.textWhite.withValues(alpha: 0.1)),
        ),
        title: Text(
          'Exit Lesson?',
          style: GoogleFonts.lexend(
            color: LessonTrainingPage.textWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Your progress will be lost. Are you sure you want to exit?',
          style: GoogleFonts.lexend(
            color: LessonTrainingPage.textWhite.withValues(alpha: 0.7),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(
              'Cancel',
              style: GoogleFonts.lexend(
                color: LessonTrainingPage.textWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              'Exit',
              style: GoogleFonts.lexend(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitConfirmDialog,
      child: Scaffold(
        backgroundColor: LessonTrainingPage.backgroundDark,
        body: SafeArea(
          child: Column(
            children: [
              Obx(() {
                // Avoid division by zero if widgetList is empty
                final progress = controller.widgetList.isNotEmpty
                    ? controller.finished.value / controller.widgetList.length
                    : 0.0;
                return _buildHeader(progress: progress);
              }),
              Expanded(
                child: Obx(
                  () => CarouselSlider(
                    carouselController: csc,
                    items: controller.widgetList,
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      height: double.infinity,
                      enableInfiniteScroll: false,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({double progress = 0.4}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () async {
                if (await _showExitConfirmDialog()) {
                  Get.back();
                }
              },
              child: const Icon(Icons.close,
                  color: LessonTrainingPage.textWhite, size: 28),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: progress),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value,
                    backgroundColor:
                        LessonTrainingPage.textWhite.withValues(alpha: 0.1),
                    color: LessonTrainingPage.primary,
                    minHeight: 10, // h-2.5
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: LessonTrainingPage.textWhite.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.bolt, color: Colors.orange, size: 20),
                const SizedBox(width: 4),
                Text(
                  "12", // Mock value
                  style: GoogleFonts.lexend(
                    color: LessonTrainingPage.textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
