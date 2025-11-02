import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/ui/pages/vocab_matching_page/vocab_matching_page.dart';

class VocabPage extends StatelessWidget {
  const VocabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Vocabulary Lesson 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.to(
                  () => VocabMatchingPage(
                    title: "Vocabulary Lesson 1",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
