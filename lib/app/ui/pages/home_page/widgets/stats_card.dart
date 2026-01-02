import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key? key,
    required this.cardWidthFactor,
    required this.title,
    required this.icon,
    required this.numberOfDays,
    this.color = Colors.orangeAccent,
  }) : super(key: key);
  final double cardWidthFactor;
  final Color color;
  final String title;
  final IconData icon;
  final int numberOfDays;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(10),
      width: Get.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withValues(alpha: 0.2),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              Text(
                title,
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Text(
            "$numberOfDays",
            style: Get.theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
