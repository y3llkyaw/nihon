import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/character_table_controller.dart';
import 'package:hiragana/app/data/enums/hiragana.dart';
import 'package:hiragana/app/ui/global_widgets/custom_chip.dart';
import 'package:hiragana/app/ui/pages/character_matching_page/character_matching_page.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({Key? key}) : super(key: key);
  final characterTableController = Get.put(CharacterTableController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'select hiragana characters you want to learn.',
              style: Get.textTheme.titleSmall,
            ),
            Obx(
              () => ElevatedButton.icon(
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      characterTableController.selectedHiragana.length > 4
                          ? Get.theme.colorScheme.primaryContainer
                          : null,
                ),
                onPressed: characterTableController.selectedHiragana.length > 4
                    ? () {
                        Get.to(() => CharacterMatchingPage());
                      }
                    : null,
                label: Text(
                  "Continue",
                  style: Get.textTheme.bodySmall!.copyWith(
                    color: Get.theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width * 0.9,
                child: Table(
                  children: hiraganaTable.map((e) {
                    return TableRow(
                        children: (e['hiragana'] as List<dynamic>)
                            .map<Widget>((hiragana) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(
                          () => CustomChip(
                            onTap: () {
                              characterTableController
                                  .toggleHiraganaSelection(hiragana);
                            },
                            isSelected: characterTableController
                                .selectedHiragana
                                .contains(hiragana),
                            hira: hiragana,
                            roma: e['romaji'][e['hiragana'].indexOf(hiragana)],
                          ),
                        ),
                      );
                    }).toList());
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
