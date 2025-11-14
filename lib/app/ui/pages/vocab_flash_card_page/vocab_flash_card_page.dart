import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_flash_card_page_controller.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/flash_card_widget.dart';

class VocabFlashCardPage extends StatelessWidget {
  VocabFlashCardPage({Key? key}) : super(key: key);
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
              Container(
                height: Get.height * 0.8,
                child: Stack(
                  children: List.generate(
                    minnaLesson1.length,
                    (index) {
                      final e = minnaLesson1.entries.elementAt(index);
                      return Obx(
                        () => AnimatedPositioned(
                          curve: Curves.easeInExpo,
                          top: Get.height * 0.15,
                          left: controller.watchedList.contains(e.key)
                              ? 700
                              : Get.width * 0.04,
                          duration: Duration(
                            milliseconds: tts.duration.value,
                          ),
                          child: AnimatedRotation(
                            curve: Curves.easeInCirc,
                            turns: controller.watchedList.contains(e.key)
                                ? 0.1
                                : 0,
                            duration:
                                Duration(milliseconds: tts.duration.value),
                            child: FlashCardWidget(
                              number: index+1,
                                onClick: () async {
                                  controller.watchedList.add(e.key);
                                  await tts.speak(e.value[0]);
                                },
                                image: e.value[2],
                                hiragana: e.value[0],
                                kenji: e.value[1],
                                meaning: e.key),
                          ),
                        ),
                      );
                    },
                  ).reversed.toList(),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text("Created By Yell Htet Kyaw"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.media_bluetooth_off)),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
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
        ));
  }
}
