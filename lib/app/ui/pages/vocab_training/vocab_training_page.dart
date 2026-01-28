import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/ui/pages/vocab_training/widgets/heart_widget.dart';

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
                  spacing: 20,
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
                    ),
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
            // CarouselSlider(
            //   items: chunkedEntries
            //       .map((chunk) => VocabMatchWidget(chunk: chunk))
            //       .toList(),
            //   options: CarouselOptions(
            //     viewportFraction: 1,
            //     height: Get.height * 0.7,
            //   ),
            // ),
          ],
        ),
      ),
    );
    // return AnimatedChipSelector();
  }
}
