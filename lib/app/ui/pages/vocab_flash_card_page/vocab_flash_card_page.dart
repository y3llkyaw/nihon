import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/flash_card_widget.dart';

class VocabFlashCardPage extends StatelessWidget {
  VocabFlashCardPage({Key? key}) : super(key: key);

  final String lessonId = Get.parameters['lesson']!;
  late final int lessonIndex = int.parse(lessonId) - 1;
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
                  Obx(
                    () => Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Switch(
                                value: controller.isMeaningShown.value,
                                onChanged: (value) {
                                  controller.isMeaningShown.value = value;
                                },
                              ),
                              Text(
                                "Show Meaning",
                                style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              AnimatedSwitcher(
                                switchInCurve: Curves.easeInExpo,
                                switchOutCurve: Curves.easeInExpo,
                                duration: Duration(milliseconds: 300),
                                child: Switch(
                                    value: controller.isRomajiShown.value,
                                    onChanged: (value) {
                                      controller.isRomajiShown.value = value;
                                    }),
                              ),
                              Text(
                                "Show Romaji",
                                style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Switch(
                                value: controller.isAutoSlide.value,
                                onChanged: (value) {
                                  controller.isAutoSlide.value = value;
                                },
                              ),
                              Text(
                                "Auto Slide",
                                style: GoogleFonts.notoSansJavanese(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => CarouselSlider(
                      items: List.generate(
                        lesson.length,
                        (index) {
                          final e = lesson.entries.elementAt(index);
                          final valueList = List<dynamic>.from(e.value as List);
                          final exampleParts = valueList.length > 4
                              ? valueList[4].toString().split('\n')
                              : [''];

                          return FlashCardWidget(
                            isImageShow: controller.isImageShow.value,
                            number: index + 1,
                            onClick: () async {
                              controller.watchedList.add(e.key);
                              await tts.speak(
                                  valueList.isNotEmpty ? valueList[0] : '');
                              controller.watchedList.add(e.key);
                            },
                            example:
                                exampleParts.isNotEmpty ? exampleParts[0] : '',
                            exampleMeaning: exampleParts.length > 1
                                ? exampleParts[1]
                                    .replaceAll("(", "")
                                    .replaceAll(")", "")
                                : '',
                            romaji: valueList.length > 2 ? valueList[2] : '',
                            image: valueList.length > 3 ? valueList[3] : '',
                            hiragana: valueList.isNotEmpty ? valueList[0] : '',
                            kenji: valueList.length > 1 ? valueList[1] : '',
                            meaning: e.key.split('\n')[0],
                            onAudioTap: () async {
                              if (exampleParts.isNotEmpty) {
                                await tts.speak(exampleParts[0]);
                              }
                            },
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 0.95,
                        autoPlay: controller.isAutoSlide.value,
                        autoPlayInterval: Duration(seconds: 2),
                        onPageChanged: (index, reason) async {
                          final e = lesson.entries.elementAt(index);
                          final valueList = List<dynamic>.from(e.value as List);
                          controller.watchedList.add(e.key);
                          await tts
                              .speak(valueList.isNotEmpty ? valueList[0] : '');
                          controller.watchedList.add(e.key);
                        },
                        height: Get.height * 0.5,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            floatingActionButton: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpeedDial(
                  animatedIcon: AnimatedIcons.menu_close,
                  children: [
                    SpeedDialChild(
                      label: "play all",
                      child: Icon(Icons.play_arrow),
                      onTap: () {},
                    ),
                    SpeedDialChild(
                      label: "restart",
                      child: Icon(Icons.restart_alt),
                      onTap: () {
                        controller.watchedList.clear();
                      },
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
