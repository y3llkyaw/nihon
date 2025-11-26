import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';

class VocabTrainingPage extends StatelessWidget {
  VocabTrainingPage({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Map<String, List<String>> lesson;
  final vtc = Get.put(VocabTrainingController());
  final tts = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    final List<List<MapEntry<String, List<String>>>> chunkedEntries = [];
    final entries = lesson.entries.toList();
    vtc.lesson.addAll(lesson);

    for (var i = 0; i < entries.length; i += 5) {
      chunkedEntries.add(
          entries.sublist(i, i + 5 > entries.length ? entries.length : i + 5));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocab Training"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(
              () {
                double finished = vtc.doneList.length / 2;
                return Column(
                  children: [
                    LinearProgressIndicator(
                      color: Get.theme.colorScheme.tertiary,
                      value: finished / lesson.length,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text("Progress: "),
                        Text(" $finished/ ${lesson.length}"),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              items: chunkedEntries.map((chunk) {
                final List burmese = chunk.map((e) => e.key).toList();
                final List japanese = chunk.map((e) => e.value[0]).toList();
                burmese.shuffle();
                japanese.shuffle();

                return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        spacing: 10,
                        children: burmese
                            .map((e) => CustomChip(
                                  onTap: () => vtc.selectBurmese(e, context),
                                  isSelected: vtc.selectedBuremese.value == e,
                                  character: e,
                                  padding: 10,
                                  fontSize: 14,
                                  isDone: vtc.doneList.contains(e),
                                ))
                            .toList(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        spacing: 10,
                        children: japanese
                            .map(
                              (e) => CustomChip(
                                onTap: () {
                                  vtc.selectJapanese(e, context);
                                  tts.speak(e);
                                },
                                isSelected: vtc.selectedJapanese.value == e,
                                character: e,
                                padding: 10,
                                fontSize: 20,
                                isDone: vtc.doneList.contains(e),
                              ),
                            )
                            .toList(),
                      ),
                    ].reversed.toList(),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 700,
              ),
            ),
          ],
        ),
      ),
    );
    // return AnimatedChipSelector();
  }
}
