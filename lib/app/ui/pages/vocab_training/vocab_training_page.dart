import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';
import 'package:hiragana/app/ui/pages/vocab_training/widgets/heart_widget.dart';

class VocabTrainingPage extends StatelessWidget {
  VocabTrainingPage({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final List<VocabularyModel> lesson;
  final vtc = Get.put(VocabTrainingController());
  final tts = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    final List<List<VocabularyModel>> chunkedEntries = [];
    final entries = lesson;
    vtc.lesson.clear();
    vtc.doneList.clear();
    vtc.lesson.addAll({for (var vocab in lesson) vocab.burmese: vocab});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => HeartWidget(
                    count: vtc.heartLeft.value,
                    heartIcon: Icons.favorite,
                  ),
                ),
                Obx(
                  () => HeartWidget(
                    count: vtc.point.value,
                    heartIcon: Icons.star,
                    iconColor: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(
              () {
                double finished = vtc.doneList.length / 2;
                return Column( 
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PROGRESS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(" ${finished.toInt()}/ ${lesson.length}"),
                      ],
                    ),const SizedBox(height: 20),
                    LinearProgressIndicator(
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(20),
                      color: Get.theme.colorScheme.tertiary,
                      value: finished / lesson.length,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              items: chunkedEntries.map((chunk) {
                final List<String> burmese =
                    chunk.map((e) => e.burmese).toList();
                final List<String> japanese =
                    chunk.map((e) => e.japanese).toList();
                burmese.shuffle();
                japanese.shuffle();

                return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                height: Get.height * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
    // return AnimatedChipSelector();
  }
}
