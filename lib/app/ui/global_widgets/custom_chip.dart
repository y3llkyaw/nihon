import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.hira,
    this.roma = "",
    this.isSelected = false,
    this.padding = 8.0,
    this.onTap,
    this.isDone = false,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback? onTap;
  final String hira;
  final String roma;
  final double padding;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    if (hira == "") {
      return SizedBox.shrink();
    }
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: AnimatedContainer(
          width: 100.w,
          padding:
              EdgeInsets.symmetric(horizontal: padding.w, vertical: padding.h),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isDone
                ? Get.theme.colorScheme.secondaryContainer
                : isSelected
                    ? Get.theme.colorScheme.primaryContainer
                    : null,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: Get.theme.colorScheme.onSecondary,
              width: 2.w,
            ),
          ),
          duration: Duration(milliseconds: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 5.h,
            children: [
              SizedBox(height: 5.h),
              Text(
                hira,
                style: GoogleFonts.notoSansJavanese(
                  color: isDone
                      ? Get.theme.colorScheme.onSecondaryContainer
                      : Get.theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.textTheme.titleMedium?.fontSize,
                ),
              ),
              roma != ""
                  ? Column(
                      children: [
                        SizedBox(height: 5.h),
                        Text(
                          roma,
                          style: TextStyle(
                            fontSize: Get.textTheme.bodyMedium!.fontSize!,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
