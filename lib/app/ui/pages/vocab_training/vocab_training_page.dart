import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/vocab_training_controller.dart';
import 'package:hiragana/app/ui/pages/vocab_training/vocab_matching_page.dart';

class VocabTrainingPage extends StatelessWidget {
  VocabTrainingPage({Key? key}) : super(key: key);

  final vtc = Get.put(VocabTrainingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocab Training"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          spacing: 20,
          children: [
            LinearProgressIndicator(
              value: 1 / 42,
            ),
            Center(
              child: VocabMatchingPage(),
            )
          ],
        ),
      ),
    );
    // return AnimatedChipSelector();
  }
}
