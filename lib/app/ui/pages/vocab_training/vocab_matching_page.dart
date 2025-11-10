import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_matching_page_controller.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';

class VocabMatchingPage extends StatelessWidget {
  VocabMatchingPage({Key? key}) : super(key: key);
  final String characters = "あいお";
  final TtsController tts = Get.put(TtsController());
  final vmc = Get.put(VocabMatchingPageController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.8,
      child: Column(
        // spacing: 20,
        children: [
          InkWell(
            onTap: () async {
              await tts.speak("あいお");
            },
            borderRadius: BorderRadius.circular(20),
            child: CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.speaker_notes_rounded,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.3,
          ),
          Divider(),
          Spacer(),
          Row(
            spacing: 20,
            children: characters
                .split("")
                .map(
                  (value) => AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(milliseconds: 300),
                    child: CustomChip(
                      hira: value,
                      padding: 0,
                      onTap: () {},
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
