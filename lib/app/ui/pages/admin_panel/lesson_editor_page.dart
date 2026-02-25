import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/admin_controller.dart';
import 'package:hiragana/app/ui/pages/admin_panel/vocabulary_item_dialog.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class LessonEditorPage extends StatefulWidget {
  final String lessonId;
  final int lessonNumber;

  const LessonEditorPage({
    Key? key,
    required this.lessonId,
    required this.lessonNumber,
  }) : super(key: key);

  @override
  State<LessonEditorPage> createState() => _LessonEditorPageState();
}

class _LessonEditorPageState extends State<LessonEditorPage> {
  final AdminController controller = Get.find<AdminController>();

  @override
  void initState() {
    super.initState();
    // Load lesson data after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadLesson(widget.lessonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.cardDark,
        elevation: 0,
        title: Text(
          'Edit Lesson ${widget.lessonNumber}',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => _showAddVocabularyDialog(context),
            tooltip: 'Add Vocabulary',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.loadLesson(widget.lessonId),
            tooltip: 'Refresh',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(() {
        // Loading state
        if (controller.isLoading.value &&
            controller.selectedLesson.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  'Loading lesson...',
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Error state
        if (controller.errorMessage.value.isNotEmpty &&
            controller.selectedLesson.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    controller.errorMessage.value,
                    style: GoogleFonts.inter(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => controller.loadLesson(widget.lessonId),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final lesson = controller.selectedLesson.value;
        if (lesson == null) {
          return const SizedBox.shrink();
        }

        final vocabulary = lesson['vocabulary'] as Map<String, dynamic>;
        final vocabularyList = vocabulary.entries.toList();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lesson ${widget.lessonNumber}',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${vocabulary.length} vocabulary items',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showAddVocabularyDialog(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Word'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Vocabulary list
              Expanded(
                child: ReorderableListView.builder(
                  onReorder: (oldIndex, newIndex) {
                    controller.reorderVocabularyItem(
                      widget.lessonId,
                      oldIndex,
                      newIndex,
                    );
                  },
                  itemCount: vocabularyList.length,
                  itemBuilder: (context, index) {
                    final entry = vocabularyList[index];
                    final burmese = entry.key;
                    final details = List<dynamic>.from(entry.value);

                    // Parse vocabulary item
                    final japanese = details.isNotEmpty ? details[0] : '';
                    final kanji = details.length > 1 ? details[1] : '';
                    final romaji = details.length > 2 ? details[2] : '';
                    // imageUrl at index 3 (not displayed in list)
                    final example = details.length > 4 ? details[4] : '';

                    return Card(
                      key: ValueKey(burmese),
                      margin: const EdgeInsets.only(bottom: 12),
                      color: AppColors.cardDark,
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 8,
                          bottom: 8,
                        ),
                        title: Text(
                          '${index + 1}. ${japanese.isNotEmpty ? japanese : burmese}',
                          style: GoogleFonts.notoSansJp(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Text(
                              burmese,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color:
                                    AppColors.textWhite.withValues(alpha: 0.8),
                              ),
                            ),
                            if (kanji.isNotEmpty || romaji.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                [
                                  if (kanji.isNotEmpty) kanji,
                                  if (romaji.isNotEmpty) romaji
                                ].join(' • '),
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                            if (example.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                example.split('\n').first,
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                  fontStyle: FontStyle.italic,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit_outlined,
                                  color: AppColors.primary),
                              onPressed: () => _showEditVocabularyDialog(
                                context,
                                burmese,
                                details,
                              ),
                              tooltip: 'Edit',
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
                              onPressed: () => _confirmDelete(context, burmese),
                              tooltip: 'Delete',
                            ),
                            ReorderableDragStartListener(
                              index: index,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Icon(Icons.drag_handle, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _showAddVocabularyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VocabularyItemDialog(
        lessonId: widget.lessonId,
        isEdit: false,
      ),
    );
  }

  void _showEditVocabularyDialog(
    BuildContext context,
    String burmese,
    List<dynamic> details,
  ) {
    showDialog(
      context: context,
      builder: (context) => VocabularyItemDialog(
        lessonId: widget.lessonId,
        isEdit: true,
        initialBurmese: burmese,
        initialDetails: details,
      ),
    );
  }

  void _confirmDelete(BuildContext context, String burmese) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: Text(
          'Delete Vocabulary',
          style: GoogleFonts.inter(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to delete "$burmese"?',
          style: GoogleFonts.inter(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Close confirmation dialog first
              Get.back();

              // Delete the item (controller will show success/error notification)
              await controller.deleteVocabularyItem(widget.lessonId, burmese);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
