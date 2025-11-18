import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/flash_card_widget.dart';

class VocabFlashCardPage extends StatelessWidget {
  VocabFlashCardPage({Key? key, required this.lesson}) : super(key: key);

  final Map<String, List<String>> lesson;

  final controller = Get.put(VocabFlashCardPageController());
  final TtsController tts = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Learn Flash Cards"),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Obx(
                () => Column(
                  spacing: 20,
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
                  ],
                ),
              ),
              Spacer(),
              CarouselSlider(
                items: List.generate(
                  lesson.length,
                  (index) {
                    final e = lesson.entries.elementAt(index);
                    return FlashCardWidget(
                      number: index + 1,
                      onClick: () async {
                        controller.watchedList.add(e.key);
                        await tts.speak(e.value[0]);
                        controller.watchedList.add(e.key);
                      },
                      romaji: e.value[2],
                      image: e.value[3],
                      hiragana: e.value[0],
                      kenji: e.value[1],
                      meaning: e.key,
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) async {
                    final e = lesson.entries.elementAt(index);
                    controller.watchedList.add(e.key);
                    await tts.speak(e.value[0]);
                    controller.watchedList.add(e.key);
                  },
                  height: Get.height * 0.5,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
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
            FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {},
              child: Icon(Icons.speaker),
            ),
          ],
        ));
  }
}
