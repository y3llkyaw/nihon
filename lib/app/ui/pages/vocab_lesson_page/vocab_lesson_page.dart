import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/ui/pages/vocab_flash_card_page/vocab_flash_card_page.dart';
import 'package:hiragana/app/ui/pages/vocab_training/vocab_training_page.dart';

class VocabLessonPage extends StatelessWidget {
  VocabLessonPage({Key? key, required this.title, required this.lesson})
      : super(key: key);
  final ttsController = Get.put(TtsController());
  final Map<String, List<String>> lesson;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.black,
          title: title,
          child: Text(title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  lesson.entries.elementAt(index);
                  final entry = lesson.entries.elementAt(index);
                  final prompt = entry.key;
                  final answers = entry.value;
                  return Obx(
                    () => AnimatedContainer(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      color: ttsController.speakingWord.value == answers[0]
                          ? Get.theme.colorScheme.secondaryContainer
                          : null,
                      duration: Duration(milliseconds: 300),
                      child: ListTile(
                        // leading: Text('${index + 1}'),
                        subtitle: Text(prompt),
                        title: Text(
                          answers[0],
                          style: GoogleFonts.notoSansJavanese(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Get.theme.colorScheme.tertiary),
                        ),
                        leading: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("  ${index + 1}  "),
                            IconButton(
                              onPressed: () async {
                                await ttsController.stop();
                                await ttsController.speak(answers[0]);
                              },
                              icon: Icon(Icons.voice_chat),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: lesson.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          icon: Icons.play_arrow,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: Icon(
                ttsController.isSpeaking.value ? Icons.stop : Icons.play_arrow,
              ),
              label: ttsController.isSpeaking.value ? "Stop" : 'Play All',
              onTap: ttsController.isSpeaking.value
                  ? () async {
                      await ttsController.stop();
                    }
                  : () async {
                      ttsController.isSpeaking.value = true;
                      for (var entry in lesson.entries) {
                        final answers = entry.value;
                        // if(e)
                        if (!ttsController.isSpeaking.value) {
                          break;
                        }
                        await ttsController.speak(answers[0]);
                      }
                      ttsController.isSpeaking.value = false;
                    },
            ),
            SpeedDialChild(
              label: "Start Quiz",
              onTap: () {
                Get.to(VocabTrainingPage());
              },
              child: Icon(Icons.quiz),
            ),
            SpeedDialChild(
              label: "Flash Cards",
              onTap: () {
                Get.to(VocabFlashCardPage(
                  lesson: lesson,
                ));
              },
              child: Icon(Icons.add_card_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
