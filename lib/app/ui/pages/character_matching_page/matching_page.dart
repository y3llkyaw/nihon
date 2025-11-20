import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/character_match_controller.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';
import 'package:hiragana/app/ui/layouts/main/main_layout.dart';

class MatchingPage extends StatelessWidget {
  MatchingPage({Key? key, this.isVocabMatching = false}): super(key: key);
  final CharacterMatchController cmc = Get.put(CharacterMatchController());
  final bool isVocabMatching;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Character Matching"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.w,
                    children: [
                      Obx(
                        () => Column(
                          spacing: 20.h,
                          children: cmc.selectedCharacterList
                              .map((character) => CustomChip(
                                    isDone:
                                        cmc.doneCharacters.contains(character),
                                    isSelected:
                                        cmc.selectedCharacter.value == character,
                                    character: character,
                                    onTap: cmc.doneCharacters.contains(character)
                                        ? null
                                        : () {
                                            cmc.selectCharacter(
                                                character, context);
                                          },
                                  ))
                              .toList(),
                        ),
                      ),
                      Obx(
                        () => Column(
                          spacing: 20.h,
                          children: cmc.selectedRomajiList
                              .map(
                                (romaji) => CustomChip(
                                  isDone: cmc.doneCharacters.contains(romaji),
                                  isSelected:
                                      cmc.selectedRomaji.value == romaji,
                                  onTap: cmc.doneCharacters.contains(romaji)
                                      ? null
                                      : () {
                                          cmc.selectRomaji(romaji, context);
                                        },
                                  character: romaji,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}