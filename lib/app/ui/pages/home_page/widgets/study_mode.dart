import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/ui/pages/character_page/character_page.dart';
import 'package:hiragana/app/ui/pages/vocab_page/vocab_page.dart';

class StudyMode extends StatelessWidget {
  const StudyMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Study Mode",
          style: Get.theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => {
            Get.to(VocabPage(), transition: Transition.rightToLeft),
          },
          child: StudyModeListTile(
            icon: CupertinoIcons.tags_solid,
            title: "Vocabulary Flashcards",
            subtitle: "Practice vocabulary with flashcards",
            color: Colors.yellow,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => {
            Get.to(CharacterPage(), transition: Transition.rightToLeft),
          },
          child: StudyModeListTile(
            icon: CupertinoIcons.table_fill,
            title: "Characters Tables",
            subtitle: "Review and Practice hiragana and katakana charts ",
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}

class StudyModeListTile extends StatelessWidget {
  const StudyModeListTile({
    Key? key,
    this.color = Colors.green,
    this.title = "Vocabulary Flashcards",
    this.subtitle = "Practice vocabulary with flashcards",
    this.icon = CupertinoIcons.book_fill,
  }) : super(key: key);
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: Get.theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Get.theme.textTheme.bodyMedium,
        ),
        trailing: Icon(
          CupertinoIcons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}
