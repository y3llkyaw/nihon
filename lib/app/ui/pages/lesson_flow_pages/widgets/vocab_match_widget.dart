import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/data/models/vocabulary_model.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';

class VocabMatchWidget extends StatefulWidget {
  final List<VocabularyModel> chunk;
  final CarouselSliderController carouselController;

  const VocabMatchWidget({
    Key? key,
    required this.chunk,
    required this.carouselController,
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

    vtc.lesson.clear();
    vtc.doneList.clear();
    vtc.selectedBuremese.value = '';
    vtc.selectedJapanese.value = '';
    vtc.carouselController.value = widget.carouselController;

    vtc.lesson.addAll({for (var vocab in widget.chunk) vocab.burmese: vocab});
    burmese = widget.chunk.map((e) => e.burmese).toList()..shuffle();
    japanese = widget.chunk.map((e) => e.japanese).toList()..shuffle();

    // Note: finished increment and nextPage navigation are handled in VocabTrainingController.isAnswerCorrect()
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
