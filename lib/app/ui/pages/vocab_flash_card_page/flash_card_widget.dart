import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCardWidget extends StatelessWidget {
  const FlashCardWidget({
    Key? key,
    required this.number,
    required this.image,
    required this.hiragana,
    required this.kenji,
    required this.meaning,
    required this.onClick,
  }) : super(key: key);

  final String image;
  final int number;
  final String meaning;
  final String hiragana;
  final String kenji;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.theme.colorScheme.primaryContainer,
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.2),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(3, 5.0),
                )
              ]),
          padding: EdgeInsets.all(10),
          width: Get.width * 0.8,
          height: Get.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                    child: Text(
                      number.toString(),
                      style: TextStyle(
                        color: Get.theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network(
                  image,
                ),
              ),
              SizedBox(height: 20),
              Text(
                hiragana,
                style: GoogleFonts.notoSansJavanese(
                  color: Get.theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                meaning,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
