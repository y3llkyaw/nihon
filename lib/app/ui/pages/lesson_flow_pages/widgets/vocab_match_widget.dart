import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';

class VocabMatchWidget extends StatefulWidget {
  final List<Map<String, List<String>>> chunk;

  const VocabMatchWidget({
    Key? key,
    required this.chunk,
  }) : super(key: key);

  @override
  State<VocabMatchWidget> createState() => _VocabMatchWidgetState();
}

class _VocabMatchWidgetState extends State<VocabMatchWidget> {
  final vtc = Get.find<VocabTrainingController>();
  final tts = Get.find<TtsController>();

  late final List<String> burmese;
  late final List<String> japanese;

  @override
  void initState() {
    super.initState();

    vtc.lesson.addAll(widget.chunk
        .map((map) => MapEntry(map.keys.first, map.values.first))
        .toList()
        .asMap()
        .map((key, value) => MapEntry(value.key, value.value))
        .cast<String, List<String>>());

    burmese = widget.chunk.expand((map) => map.keys).toList()..shuffle();
    japanese = widget.chunk.map((e) => e.values.first[0]).toList()..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: burmese
                .map(
                  (e) => CustomChip(
                    onTap: () => vtc.selectBurmese(e, context),
                    isSelected: vtc.selectedBuremese.value == e,
                    character: e,
                    padding: 10,
                    fontSize: 14,
                    isDone: vtc.doneList.contains(e),
                  ),
                )
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
  }
}
