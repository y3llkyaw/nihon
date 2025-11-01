import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';

class VocabMatchingPage extends StatelessWidget {
  VocabMatchingPage({Key? key}) : super(key: key);
  final ttsController = Get.put(TtsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocab Matching"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            minnaLesson1.entries.elementAt(index);
            final entry = minnaLesson1.entries.elementAt(index);
            final prompt = entry.key;
            final answers = entry.value;
            return ListTile(
              leading: Text('${index + 1}'),
              subtitle: Text(prompt),
              title: Text(answers[0]),
              trailing: IconButton(
                onPressed: () async {
                  await ttsController.stop();
                  await ttsController.speak(answers[0]);
                },
                icon: Icon(Icons.voice_chat),
              ),
            );
          },
          itemCount: minnaLesson1.length,
        ),
      ),
    );
  }
}
