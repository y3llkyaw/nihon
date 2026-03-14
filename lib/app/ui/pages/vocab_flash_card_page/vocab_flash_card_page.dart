import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';
import 'package:hiragana/app/data/helpers/vocab_data_helper.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/flash_card_widget.dart';

class VocabFlashCardPage extends StatelessWidget {
  VocabFlashCardPage({Key? key}) : super(key: key);

  final String lessonId = Get.parameters['lesson']!;
  late final int lessonIndex = int.parse(lessonId) - 1;
  final JapaneseDataRepository dataRepo = Get.find<JapaneseDataRepository>();

  final controller = Get.put(VocabFlashCardPageController());
  final TtsController tts = Get.put(TtsController());
  final UserController userController = Get.find<UserController>();

  int _calculateAutoPlayInterval() {
    int seconds = 2;
    if (controller.isExampleSentenceSpoken.value) seconds += 3;
    if (controller.isBurmeseSpoken.value) seconds += 4;
    return seconds;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: dataRepo.getVocabularyLesson(lessonIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text("Learn Flash Cards")),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text("Learn Flash Cards")),
            body: Center(
                child: Text("Error loading flashcards: ${snapshot.error}")),
          );
        }

        final lesson = snapshot.data!;

        return Scaffold(
            appBar: AppBar(
              title: Text("Learn Flash Cards"),
            ),
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 0,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Spacer(),
                  Obx(
                    () => CarouselSlider(
                      items: List.generate(
                        lesson.length,
                        (index) {
                          final e = lesson.entries.elementAt(index);
                          final vocab = VocabDisplayData.fromEntry(e);

                          return Obx(() => FlashCardWidget(
                                isImageShow: controller.isImageShow.value,
                                number: index + 1,
                                isStarred: userController.isVocabStarred(
                                    lessonIndex, e.key),
                                onStarTap: () {
                                  userController.toggleStarVocab(
                                      lessonIndex, e.key);
                                },
                                onClick: () async {
                                  controller.watchedList.add(e.key);
                                  String textToSpeak = vocab.hiragana;
                                  if (controller
                                          .isExampleSentenceSpoken.value &&
                                      vocab.example.trim().isNotEmpty) {
                                    textToSpeak += "。 ${vocab.example.trim()}";
                                  }
                                  if (textToSpeak.trim().isNotEmpty) {
                                    await tts.speak(textToSpeak);
                                  }
                                  if (controller.isBurmeseSpoken.value &&
                                      vocab.meaning.trim().isNotEmpty) {
                                    await tts.speakBurmese(vocab.meaning.trim());
                                  }
                                  controller.watchedList.add(e.key);
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
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 0.95,
                        autoPlay: controller.isAutoSlide.value,
                        autoPlayInterval: Duration(
                            seconds: _calculateAutoPlayInterval()),
                        onPageChanged: (index, reason) async {
                          final e = lesson.entries.elementAt(index);
                          final vocab = VocabDisplayData.fromEntry(e);
                          controller.watchedList.add(e.key);
                          String textToSpeak = vocab.hiragana;
                          if (controller.isExampleSentenceSpoken.value &&
                              vocab.example.trim().isNotEmpty) {
                            textToSpeak += "。 ${vocab.example.trim()}";
                          }
                          if (textToSpeak.trim().isNotEmpty) {
                            await tts.speak(textToSpeak);
                          }
                          if (controller.isBurmeseSpoken.value &&
                              vocab.meaning.trim().isNotEmpty) {
                            await tts.speakBurmese(vocab.meaning.trim());
                          }
                          controller.watchedList.add(e.key);
                        },
                        height: Get.height * 0.65, // Increased height
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              children: [
                SpeedDialChild(
                  labelWidget: Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.isMeaningShown.value
                              ? "Hide Meaning"
                              : "Show Meaning",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                  child: Obx(() => Icon(
                        controller.isMeaningShown.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      )),
                  onTap: () {
                    controller.isMeaningShown.value =
                        !controller.isMeaningShown.value;
                  },
                ),
                SpeedDialChild(
                  labelWidget: Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.isRomajiShown.value
                              ? "Hide Romaji"
                              : "Show Romaji",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                  child: Obx(() => Icon(
                        controller.isRomajiShown.value
                            ? Icons.abc
                            : Icons.abc_outlined,
                      )),
                  onTap: () {
                    controller.isRomajiShown.value =
                        !controller.isRomajiShown.value;
                  },
                ),
                SpeedDialChild(
                  labelWidget: Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.isExampleSentenceSpoken.value
                              ? "Mute Example"
                              : "Speak Example",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                  child: Obx(() => Icon(
                        controller.isExampleSentenceSpoken.value
                            ? Icons.record_voice_over
                            : Icons.voice_over_off,
                      )),
                  onTap: () {
                    controller.isExampleSentenceSpoken.value =
                        !controller.isExampleSentenceSpoken.value;
                  },
                ),
                SpeedDialChild(
                  labelWidget: Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.isBurmeseSpoken.value
                              ? "Mute Burmese"
                              : "Speak Burmese",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                  child: Obx(() => Icon(
                        controller.isBurmeseSpoken.value
                            ? Icons.translate
                            : Icons.translate_outlined,
                      )),
                  onTap: () {
                    controller.isBurmeseSpoken.value =
                        !controller.isBurmeseSpoken.value;
                  },
                ),
                SpeedDialChild(
                  labelWidget: Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.isAutoSlide.value
                              ? "Stop Auto Slide"
                              : "Auto Slide",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                  child: Obx(() => Icon(
                        controller.isAutoSlide.value
                            ? Icons.pause_circle
                            : Icons.play_circle,
                      )),
                  onTap: () {
                    controller.isAutoSlide.value =
                        !controller.isAutoSlide.value;
                  },
                ),
                SpeedDialChild(
                  label: "Play All",
                  child: const Icon(Icons.play_arrow),
                  onTap: () {},
                ),
                SpeedDialChild(
                  label: "Restart",
                  child: const Icon(Icons.restart_alt),
                  onTap: () {
                    controller.watchedList.clear();
                  },
                ),
              ],
            ));
      },
    );
  }
}
