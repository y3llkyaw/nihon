import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiragana/app/ui/pages/home_page/widgets/progress_card.dart';
import 'package:hiragana/app/ui/pages/home_page/widgets/stats_card.dart';
import 'package:hiragana/app/ui/pages/home_page/widgets/study_mode.dart';
import 'package:hiragana/app/ui/pages/home_page/widgets/word_ot_day.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yell Htet Kyaw',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Level 6'),
                ],
              ),
              trailing: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatsCard(
                  cardWidthFactor: 0.6,
                  title: 'STREAK',
                  icon: CupertinoIcons.flame_fill,
                  numberOfDays: 10,
                ),
                StatsCard(
                  cardWidthFactor: 0.6,
                  title: 'LEARNED',
                  icon: CupertinoIcons.book_fill,
                  color: Colors.blue,
                  numberOfDays: 190,
                ),
              ],
            ),
            ProgressCard(),
            WordOtDay(),
            StudyMode(),
          ],
        ),
      ),
    );
  }
}
