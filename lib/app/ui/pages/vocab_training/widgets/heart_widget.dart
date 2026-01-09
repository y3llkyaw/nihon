import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    Key? key,
    required this.count,
    required this.heartIcon,
    this.iconColor = Colors.red,
  }) : super(key: key);

  final int count;
  final IconData heartIcon;
  final Color iconColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        spacing: 20,
        children: [
          Icon(
            heartIcon,
            color: iconColor,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              "$count",
              key: ValueKey<int>(count),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.titleMedium!.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
