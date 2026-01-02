import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordOtDay extends StatelessWidget {
  const WordOtDay({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kenji of the Day",
          style: Get.theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Stack(
          children: [
            Container(
              height: 200,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DAILY NEW WORD",
                    style: Get.theme.textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "学校",
                        style: Get.theme.textTheme.displayMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Gakkou",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        "School",
                        style: Get.theme.textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                child: Icon(
                  Icons.volume_up,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
