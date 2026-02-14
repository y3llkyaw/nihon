import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/character_table_controller.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';
import 'package:hiragana/app/ui/pages/character_matching_page/matching_page.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({Key? key}) : super(key: key);
  final characterTableController = Get.put(CharacterTableController());
  final dataRepo = Get.find<JapaneseDataRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Tables"),
      ),
      body: FutureBuilder<List<List<Map<String, dynamic>>>>(
        future: Future.wait([
          dataRepo.getHiraganaTable(),
          dataRepo.getKatakanaTable(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading character tables'),
                  const SizedBox(height: 8),
                  Text('${snapshot.error}', style: Get.textTheme.bodySmall),
                ],
              ),
            );
          }

          final hiraganaTable = snapshot.data![0];
          final katakanaTable = snapshot.data![1];

          return DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'select characters you want to learn.',
                    style: Get.textTheme.titleSmall,
                  ),
                  Obx(
                    () => ElevatedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            characterTableController.selectedCharacters.length >
                                    4
                                ? Get.theme.colorScheme.primaryContainer
                                : null,
                      ),
                      onPressed: () {
                        final tabIndex = DefaultTabController.of(context).index;
                        final selected =
                            characterTableController.selectedCharacters;
                        List<String> gameCharacters;
                        if (tabIndex == 0) {
                          // Hiragana
                          gameCharacters =
                              selected.where((c) => isHiragana(c)).toList();
                        } else {
                          // Katakana
                          gameCharacters =
                              selected.where((c) => isKatakana(c)).toList();
                        }

                        if (gameCharacters.length > 4) {
                          characterTableController
                              .setGameCharacters(gameCharacters);
                          Get.to(() => MatchingPage());
                        } else {
                          Get.snackbar(
                            "Not enough characters",
                            "Please select at least 5 characters from the current tab to start the training.",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      label: Text(
                        "Continue",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Get.theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  const TabBar(
                    tabs: [
                      Tab(text: 'Hiragana'),
                      Tab(text: 'Katakana'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildTable(hiraganaTable, 'hiragana'),
                        _buildTable(katakanaTable, 'katakana'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTable(List<Map<String, dynamic>> tableData, String type) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: Get.width * 0.9,
          child: Table(
            children: tableData.map((e) {
              return TableRow(
                  children: (e[type] as List<dynamic>).map<Widget>((character) {
                if (character.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Obx(
                    () => CustomChip(
                      onTap: () {
                        characterTableController
                            .toggleCharacterSelection(character);
                      },
                      isSelected: characterTableController.selectedCharacters
                          .contains(character),
                      character: character,
                      roma: e['romaji'][e[type].indexOf(character)],
                    ),
                  ),
                );
              }).toList());
            }).toList(),
          ),
        ),
      ),
    );
  }
}
