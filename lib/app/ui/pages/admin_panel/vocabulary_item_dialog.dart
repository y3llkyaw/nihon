import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/admin_controller.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class VocabularyItemDialog extends StatefulWidget {
  final String lessonId;
  final bool isEdit;
  final String? initialBurmese;
  final List<dynamic>? initialDetails;

  const VocabularyItemDialog({
    Key? key,
    required this.lessonId,
    required this.isEdit,
    this.initialBurmese,
    this.initialDetails,
  }) : super(key: key);

  @override
  State<VocabularyItemDialog> createState() => _VocabularyItemDialogState();
}

class _VocabularyItemDialogState extends State<VocabularyItemDialog> {
  final AdminController controller = Get.find<AdminController>();
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController burmeseController;
  late final TextEditingController japaneseController;
  late final TextEditingController kanjiController;
  late final TextEditingController romajiController;
  late final TextEditingController imageUrlController;
  late final TextEditingController exampleController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data if editing
    burmeseController = TextEditingController(
      text: widget.initialBurmese ?? '',
    );

    if (widget.isEdit && widget.initialDetails != null) {
      final details = widget.initialDetails!;
      japaneseController = TextEditingController(
        text: details.isNotEmpty ? details[0] : '',
      );
      kanjiController = TextEditingController(
        text: details.length > 1 ? details[1] : '',
      );
      romajiController = TextEditingController(
        text: details.length > 2 ? details[2] : '',
      );
      imageUrlController = TextEditingController(
        text: details.length > 3 ? details[3] : '',
      );
      exampleController = TextEditingController(
        text: details.length > 4 ? details[4] : '',
      );
    } else {
      japaneseController = TextEditingController();
      kanjiController = TextEditingController();
      romajiController = TextEditingController();
      imageUrlController = TextEditingController();
      exampleController = TextEditingController();
    }
  }

  @override
  void dispose() {
    burmeseController.dispose();
    japaneseController.dispose();
    kanjiController.dispose();
    romajiController.dispose();
    imageUrlController.dispose();
    exampleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardDark,
      title: Text(
        widget.isEdit ? 'Edit Vocabulary' : 'Add Vocabulary',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Burmese
                TextFormField(
                  controller: burmeseController,
                  decoration: InputDecoration(
                    labelText: 'Burmese (Myanmar) *',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Burmese translation is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Japanese
                TextFormField(
                  controller: japaneseController,
                  decoration: InputDecoration(
                    labelText: 'Japanese (Hiragana/Katakana) *',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white, fontFamily: 'jp'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Japanese is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Kanji
                TextFormField(
                  controller: kanjiController,
                  decoration: InputDecoration(
                    labelText: 'Kanji (Optional)',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white, fontFamily: 'jp'),
                ),
                const SizedBox(height: 12),

                // Romaji
                TextFormField(
                  controller: romajiController,
                  decoration: InputDecoration(
                    labelText: 'Romaji *',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Romaji is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Image URL
                TextFormField(
                  controller: imageUrlController,
                  decoration: InputDecoration(
                    labelText: 'Image URL (Optional)',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                ),
                const SizedBox(height: 12),

                // Example Sentence
                TextFormField(
                  controller: exampleController,
                  decoration: InputDecoration(
                    labelText: 'Example Sentence (Optional)',
                    labelStyle: GoogleFonts.inter(color: Colors.grey),
                    hintText: 'Japanese sentence\\nBurmese translation',
                    hintStyle: GoogleFonts.inter(color: Colors.grey.shade700),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: GoogleFonts.inter(color: Colors.white),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveVocabulary,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
          child: Text(widget.isEdit ? 'Update' : 'Add'),
        ),
      ],
    );
  }

  void _saveVocabulary() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Build details array
    final details = [
      japaneseController.text.trim(),
      kanjiController.text.trim(),
      romajiController.text.trim(),
      imageUrlController.text.trim(),
      exampleController.text.trim(),
    ];

    bool success;
    if (widget.isEdit) {
      success = await controller.updateVocabularyItem(
        widget.lessonId,
        widget.initialBurmese!,
        burmeseController.text.trim(),
        details,
      );
    } else {
      success = await controller.addVocabularyItem(
        widget.lessonId,
        burmeseController.text.trim(),
        details,
      );
    }

    if (success) {
      Get.back();
    }
  }
}
