import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/routes/app_routes.dart';

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
                  Get.toNamed(
                    "${AppRoutes.VOCABULARY}${AppRoutes.VOCAB_LESSON}"
                        .replaceFirst(':lesson', '${index + 1}'),
                  );
                },
              );
            }),
      ),
    );
  }
}
