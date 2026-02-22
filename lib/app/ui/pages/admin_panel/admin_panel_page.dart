import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiragana/app/controllers/admin_controller.dart';
import 'package:hiragana/app/ui/pages/admin_panel/lesson_editor_page.dart';
import 'package:hiragana/app/ui/theme/theme.dart';

class AdminPanelPage extends StatelessWidget {
  AdminPanelPage({Key? key}) : super(key: key);

  final AdminController controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    // Check if user is admin
    if (!controller.isAdmin()) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Access Denied',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You do not have admin privileges',
                style: GoogleFonts.inter(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    // Load lessons on init
    controller.loadLessons();

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.cardDark,
        elevation: 0,
        title: Text(
          'Admin Panel',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.loadLessons(),
            tooltip: 'Refresh',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Obx(() {
        // Loading state
        if (controller.isLoading.value && controller.lessons.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  'Loading lessons...',
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Error state
        if (controller.errorMessage.value.isNotEmpty &&
            controller.lessons.isEmpty) {
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
                  onPressed: () => controller.loadLessons(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Lessons list
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Vocabulary Lessons',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${controller.lessons.length} lessons available',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Lessons grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio:
                        1.0, // Reduced from 1.2 to give more vertical space
                  ),
                  itemCount: controller.lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = controller.lessons[index];
                    final lessonNumber = lesson['lesson_number'];
                    final vocabularyCount =
                        (lesson['vocabulary'] as Map).length;

                    return InkWell(
                      onTap: () {
                        Get.to(() => LessonEditorPage(
                              lessonId: lesson['id'],
                              lessonNumber: lessonNumber,
                            ));
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                AppColors.textSlate700.withValues(alpha: 0.3),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.menu_book_rounded,
                                color: AppColors.primary,
                                size: 24,
                              ),
                            ),
                            // const SizedBox(height: 8),
                            Text(
                              'Lesson $lessonNumber',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '$vocabularyCount words',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: Colors.grey,
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
}
