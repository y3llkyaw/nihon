import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/character_table_controller.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';

class CharacterMatchController extends GetxController {
  final _characterTableController = Get.put(CharacterTableController());

  var selectedCharacter = "".obs;
  var selectedRomaji = "".obs;

  var doneCharacters = [].obs;

  final RxList<String> selectedCharacterList = <String>[].obs;
  final RxList<String> selectedRomajiList = <String>[].obs;

  late final Map<String, String> _characterMap;

  @override
  void onInit() {
    super.onInit();
    onStartup();
  }

  void onStartup() {
    selectedCharacterList.assignAll(_characterTableController.gameCharacters);
    selectedCharacterList.shuffle();

    if (selectedCharacterList.isNotEmpty &&
        isHiragana(selectedCharacterList.first)) {
      _characterMap = hiraganaMap;
    } else {
      _characterMap = katakanaMap;
    }

    for (var character in selectedCharacterList) {
      var romaji = _characterMap[character];
      if (romaji != null) {
        selectedRomajiList.add(romaji);
      }
    }
    selectedRomajiList.shuffle();
  }

  void selectRomaji(String romaji, BuildContext context) {
    selectedRomaji.value = romaji;
    if (selectedCharacter.value.isNotEmpty && selectedRomaji.value.isNotEmpty) {
      checkMatch(context);
    }
  }

  void selectCharacter(String character, BuildContext context) {
    selectedCharacter.value = character;
    if (selectedCharacter.value.isNotEmpty && selectedRomaji.value.isNotEmpty) {
      checkMatch(context);
    }
  }

  void checkMatch(BuildContext context) {
    final done = SnackBar(
      closeIconColor: Get.theme.colorScheme.onPrimaryContainer,
      showCloseIcon: true,
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Wow! You got it right!',
            style: TextStyle(
              color: Get.theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              '${selectedCharacter.value}  ${_characterMap[selectedCharacter.value]}',
              style: GoogleFonts.notoSansJavanese(
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.tertiary,
                fontSize: Get.textTheme.titleLarge!.fontSize!.sp,
              ),
            ),
          ),
        ],
      ),
    );
    if (_characterMap[selectedCharacter.value] == selectedRomaji.value) {
      doneCharacters.add(selectedCharacter.value);
      doneCharacters.add(selectedRomaji.value);
      log(doneCharacters.toString());
    } else {
      final wrong = SnackBar(
        closeIconColor: Get.theme.colorScheme.onErrorContainer,
        showCloseIcon: true,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Incorrect Match!',
              style: TextStyle(
                color: Get.theme.colorScheme.onErrorContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '${selectedCharacter.value}  ${_characterMap[selectedCharacter.value]}',
                style: GoogleFonts.notoSansJavanese(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.tertiary,
                  fontSize: Get.textTheme.titleLarge!.fontSize!.sp,
                ),
              ),
            ),
          ],
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(wrong);
    }
    selectedCharacter.value = "";
    selectedRomaji.value = "";
    if (doneCharacters.length == 10) {
      ScaffoldMessenger.of(context).showSnackBar(done);
    }
  }
}
