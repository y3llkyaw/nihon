import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/ui/pages/vocab_lesson_page/vocab_lesson_page.dart';

class VocabPage extends StatelessWidget {
  const VocabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: ListView.builder(
            itemCount: vocabLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.book),
                title: Text("Vocabulary Lesson ${index + 1}"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Get.to(
                    () => VocabLessonPage(
                      lesson: vocabLessons[index],
                      title: "Vocabulary Lesson 1",
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
