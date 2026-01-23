import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/lesson_trainning_page_controller.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';

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

  final LessonTrainningPageController controller =
      Get.put(LessonTrainningPageController());

  @override
  void initState() {
    controller.widgetList.value = widget.lesson.map<Widget>((entry) {
      final japanese = entry.value[0];
      return _buildTypingQuizItem(japanese, csc);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LessonTrainingPage.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => _buildHeader(
                progress:
                    controller.finished.value / controller.widgetList.length)),
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
              onTap: () => Get.back(),
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
                        LessonTrainingPage.textWhite.withOpacity(0.1),
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

  Widget _buildTypingQuizItem(
    String japanese,
    CarouselSliderController csc,
  ) {
    final TextEditingController answerController = TextEditingController();
    final TtsController ttsController = TtsController();

    final LessonTrainningPageController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 40,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "QUIZ MODE",
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                "Type what you hear",
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              await ttsController.speak(japanese);
            },
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: LessonTrainingPage.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.volume_up,
                color: LessonTrainingPage.textWhite,
                size: 48,
              ),
            ),
          ),
          Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4.0,
                ),
                decoration: InputDecoration(
                  hintText: "ひらがな",
                  hintStyle: TextStyle(
                      color:
                          LessonTrainingPage.textWhite.withValues(alpha: 0.2)),
                  filled: true,
                  fillColor:
                      LessonTrainingPage.textWhite.withValues(alpha: 0.05),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color:
                            LessonTrainingPage.textWhite.withValues(alpha: 0.1),
                        width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color:
                            LessonTrainingPage.textWhite.withValues(alpha: 0.1),
                        width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: LessonTrainingPage.primary, width: 2),
                  ),
                ),
                controller: answerController,
              ),
              const SizedBox(height: 16),
              Text(
                "Japanese Keyboard Active",
                style: GoogleFonts.lexend(
                  color: LessonTrainingPage.textWhite.withValues(alpha: 0.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 64,
            child: ElevatedButton(
              onPressed: () {
                final cleanJapanese = japanese.replaceAll("～", "");
                if (answerController.text.trim() == cleanJapanese) {
                  csc.nextPage();
                  controller.finished.value += 1;
                  log("Correct Answer: ${answerController.text}");
                } else {
                  log("Incorrect!\n Correct Answer: $cleanJapanese");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: LessonTrainingPage.textWhite,
                foregroundColor: LessonTrainingPage.backgroundDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check",
                    style: GoogleFonts.lexend(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
