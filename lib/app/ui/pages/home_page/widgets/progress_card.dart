import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              spacing: 20,
              children: [
                Icon(
                  CupertinoIcons.flag_fill,
                  color: Colors.blue,
                ),
                Text(
                  "Daily Goal",
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Spacer(),
                Text(
                  "1/10 Words",
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              color: Colors.blueAccent.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(30),
              value: 0.4,
              minHeight: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Almost there!",
              style: Get.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
