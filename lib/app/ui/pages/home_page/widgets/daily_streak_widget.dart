import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class DailyStreakWidget extends StatelessWidget {
  const DailyStreakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<UserController>()) return const SizedBox.shrink();
    final UserController userController = Get.find<UserController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.grey[400], size: 20),
                const SizedBox(width: 8),
                Text(
                  'PAST 7 DAYS',
                  style: GoogleFonts.lexend(
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() {
              final studiedDates = userController.studiedDates;
              final now = DateTime.now();
              // Generate last 7 days including today
              final List<DateTime> last7Days = List.generate(7, (index) {
                return now.subtract(Duration(days: 6 - index));
              });

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: last7Days.map((date) {
                  final dateStr =
                      "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                  final isStudied = studiedDates.contains(dateStr);
                  final isToday = date.year == now.year &&
                      date.month == now.month &&
                      date.day == now.day;

                  final dayOfWeek = _getDayOfWeek(date.weekday);

                  return Column(
                    children: [
                      Text(
                        dayOfWeek,
                        style: GoogleFonts.lexend(
                          color: isToday ? Colors.white : Colors.grey[500],
                          fontSize: 12,
                          fontWeight:
                              isToday ? FontWeight.bold : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isStudied
                              ? AppColors.primary.withOpacity(0.2)
                              : Colors.transparent,
                          border: Border.all(
                            color: isStudied
                                ? AppColors.primary
                                : Colors.grey.shade700,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            isStudied
                                ? Icons.local_fire_department
                                : Icons.circle,
                            size: isStudied ? 20 : 8,
                            color: isStudied
                                ? Colors.orange.shade500
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
      default:
        return '';
    }
  }
}
