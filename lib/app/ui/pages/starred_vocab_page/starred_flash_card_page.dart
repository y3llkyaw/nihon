import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';
import 'package:hiragana/app/data/helpers/vocab_data_helper.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/flash_card_widget.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class StarredFlashCardPage extends StatelessWidget {
  StarredFlashCardPage({Key? key, required this.lessonIndex}) : super(key: key);

  final int lessonIndex;
  final UserController userController = Get.find<UserController>();
  final JapaneseDataRepository dataRepo = Get.find<JapaneseDataRepository>();
  final controller = Get.put(VocabFlashCardPageController());
  final TtsController tts = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: dataRepo.getVocabularyLesson(lessonIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: AppColors.backgroundDark,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundDark,
              title: Text(
                "Starred - Lesson ${lessonIndex + 1}",
                style: GoogleFonts.lexend(fontWeight: FontWeight.bold),
              ),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: AppColors.backgroundDark,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundDark,
              title: Text("Starred - Lesson ${lessonIndex + 1}"),
            ),
            body: Center(
              child: Text(
                "Error loading flashcards: ${snapshot.error}",
                style: GoogleFonts.inter(color: Colors.grey),
              ),
            ),
          );
        }

        final lesson = snapshot.data!;

        return Scaffold(
          backgroundColor: AppColors.backgroundDark,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundDark,
            title: Text(
              "Starred - Lesson ${lessonIndex + 1}",
              style: GoogleFonts.lexend(fontWeight: FontWeight.bold),
            ),
          ),
          body: Obx(() {
            final starredKeys =
                userController.starredVocabs[lessonIndex.toString()] ?? [];

            if (starredKeys.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border_rounded,
                        size: 64, color: Colors.grey.shade600),
                    const SizedBox(height: 16),
                    Text(
                      "No starred words in this lesson",
                      style:
                          GoogleFonts.lexend(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              );
            }

            // Filter lesson entries to only starred ones
            final starredEntries = lesson.entries
                .where((e) => starredKeys.contains(e.key))
                .toList();

            return Column(
              children: [
                // Toggle switches
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Obx(() => Row(
                        children: [
                          Switch(
                            value: controller.isMeaningShown.value,
                            onChanged: (v) =>
                                controller.isMeaningShown.value = v,
                          ),
                          Text("Meaning",
                              style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(width: 16),
                          Switch(
                            value: controller.isRomajiShown.value,
                            onChanged: (v) =>
                                controller.isRomajiShown.value = v,
                          ),
                          Text("Romaji",
                              style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )),
                ),
                const Spacer(),
                CarouselSlider(
                  items: starredEntries.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final e = entry.value;
                    final vocab = VocabDisplayData.fromEntry(e);

                    return Obx(() => FlashCardWidget(
                          isImageShow: controller.isImageShow.value,
                          number: idx + 1,
                          isStarred:
                              userController.isVocabStarred(lessonIndex, e.key),
                          onStarTap: () {
                            userController.toggleStarVocab(lessonIndex, e.key);
                          },
                          onClick: () async {
                            String textToSpeak = vocab.hiragana;
                            if (controller.isExampleSentenceSpoken.value &&
                                vocab.example.trim().isNotEmpty) {
                              textToSpeak += "\u3002 ${vocab.example.trim()}";
                            }
                            if (textToSpeak.trim().isNotEmpty) {
                              await tts.speak(textToSpeak);
                            }
                          },
                          example: vocab.example,
                          exampleMeaning: vocab.exampleMeaning,
                          romaji: vocab.romaji,
                          image: vocab.imageUrl,
                          hiragana: vocab.hiragana,
                          kenji: vocab.kanji,
                          meaning: vocab.meaning,
                          onAudioTap: () async {
                            if (vocab.example.isNotEmpty) {
                              await tts.speak(vocab.example);
                            }
                          },
                        ));
                  }).toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.95,
                    height: Get.height * 0.5,
                    enlargeCenterPage: true,
                  ),
                ),
                const Spacer(),
              ],
            );
          }),
        );
      },
    );
  }
}
