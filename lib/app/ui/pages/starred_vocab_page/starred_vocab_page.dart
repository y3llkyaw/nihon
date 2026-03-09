import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/tts_controller.dart';
import 'package:hiragana/app/controllers/user_controller.dart';
import 'package:hiragana/app/data/repositories/japanese_data_repository.dart';
import 'package:hiragana/app/ui/pages/starred_vocab_page/starred_flash_card_page.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class StarredVocabPage extends StatelessWidget {
  StarredVocabPage({Key? key}) : super(key: key);

  final UserController userController = Get.find<UserController>();
  final JapaneseDataRepository dataRepo = Get.find<JapaneseDataRepository>();
  final TtsController ttsController = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark.withOpacity(0.8),
        elevation: 0,
        title: Text(
          "Starred Words",
          style: GoogleFonts.lexend(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${userController.totalStarredCount}',
                      style: GoogleFonts.lexend(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: Obx(() {
        final starredMap = userController.starredVocabs;

        // Get lesson indices that have starred items, sorted
        final lessonKeys = starredMap.keys
            .where((key) => starredMap[key]!.isNotEmpty)
            .toList()
          ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));

        if (lessonKeys.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border_rounded,
                    size: 80, color: Colors.grey.shade700),
                const SizedBox(height: 20),
                Text(
                  "No starred words yet",
                  style: GoogleFonts.lexend(
                    color: Colors.grey.shade500,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Star words from flashcards or lesson pages\nto review them here",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: dataRepo.getVocabularyLessons(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            final allLessons = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: lessonKeys.length,
              itemBuilder: (context, sectionIndex) {
                final lessonKey = lessonKeys[sectionIndex];
                final lessonIdx = int.parse(lessonKey);
                final starredKeys = starredMap[lessonKey]!;

                // Get lesson data if available
                Map<String, dynamic>? lessonData;
                if (lessonIdx < allLessons.length) {
                  lessonData = allLessons[lessonIdx];
                }

                return _buildLessonSection(
                  lessonIdx: lessonIdx,
                  starredKeys: starredKeys,
                  lessonData: lessonData,
                );
              },
            );
          },
        );
      }),
    );
  }

  Widget _buildLessonSection({
    required int lessonIdx,
    required List<String> starredKeys,
    Map<String, dynamic>? lessonData,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.textSlate700.withOpacity(0.3),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Lesson Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.textSlate700.withOpacity(0.2),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${lessonIdx + 1}',
                      style: GoogleFonts.lexend(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lesson ${lessonIdx + 1}',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${starredKeys.length} starred word${starredKeys.length != 1 ? 's' : ''}',
                        style: GoogleFonts.inter(
                          color: AppColors.textSlate400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Flash Cards button
                Material(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Get.to(
                          () => StarredFlashCardPage(lessonIndex: lessonIdx));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.creditcard,
                              color: AppColors.primary, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            'Cards',
                            style: GoogleFonts.lexend(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Vocab list
          ...starredKeys.asMap().entries.map((entry) {
            final vocabKey = entry.value;

            // Try to get Japanese text from lesson data
            String japaneseText = '';
            if (lessonData != null && lessonData.containsKey(vocabKey)) {
              final valueList =
                  List<dynamic>.from(lessonData[vocabKey] as List);
              japaneseText = valueList.isNotEmpty ? valueList[0] : '';
            }

            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: ListTile(
                    dense: true,
                    leading: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (japaneseText.isNotEmpty) {
                          ttsController.speak(japaneseText);
                        }
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.volume_up_rounded,
                            color: AppColors.primary, size: 18),
                      ),
                    ),
                    title: Text(
                      japaneseText.isNotEmpty ? japaneseText : vocabKey,
                      style: GoogleFonts.notoSansJavanese(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      vocabKey,
                      style: GoogleFonts.inter(
                        color: AppColors.textSlate400,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Obx(() => IconButton(
                          onPressed: () {
                            userController.toggleStarVocab(lessonIdx, vocabKey);
                          },
                          icon: Icon(
                            userController.isVocabStarred(lessonIdx, vocabKey)
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: userController.isVocabStarred(
                                    lessonIdx, vocabKey)
                                ? Colors.amber
                                : Colors.grey,
                          ),
                        )),
                  ),
                ),
                if (entry.key < starredKeys.length - 1)
                  Divider(
                    color: AppColors.textSlate700.withOpacity(0.15),
                    height: 1,
                    indent: 64,
                    endIndent: 16,
                  ),
              ],
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
