import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiragana/app/controllers/user_controller.dart';

class LessonTrainningPageController extends GetxController {
  final widgetList = <Widget>[].obs;
  final finished = 0.obs;
  final lesson = 0.obs;
  final chunk = 0.obs;
  final totalQuestions = 0.obs;
  final carouselController = CarouselSliderController().obs;

  /// Adds a widget to the end of the list for retry when user answers incorrectly.
  void addRetryWidget(Widget Function() widgetBuilder) {
    widgetList.add(widgetBuilder());
  }

  /// Called when user answers correctly. Increments finished count and checks if lesson is complete.
  /// Returns true if the lesson is complete, false otherwise.
  Future<bool> onCorrectAnswer() async {
    finished.value++;

    if (finished.value >= totalQuestions.value) {
      await _completeLessonChunk();
      return true;
    }
    return false;
  }

  /// Advances to the next page in the carousel after a correct answer.
  Future<void> advanceToNextPage(
      {Duration delay = const Duration(milliseconds: 500)}) async {
    await Future.delayed(delay);
    carouselController.value.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  /// Handles lesson chunk completion - saves progress and navigates back.
  Future<void> _completeLessonChunk() async {
    final userController = Get.find<UserController>();
    widgetList.clear();
    await userController.addFinishedChunk(lesson.value, chunk.value);
    await userController.fetchUserData(FirebaseAuth.instance.currentUser!.uid);
    await AudioPlayer().play(AssetSource('audios/ss.mp3'));
    Get.back(result: true);
    Get.back(result: true);
  }

  /// List of callbacks to execute when the controller is disposed.
  final List<VoidCallback> _disposeCallbacks = [];

  /// Registers a callback to be executed when this controller is closed.
  void addDisposeCallback(VoidCallback callback) {
    _disposeCallbacks.add(callback);
  }

  @override
  void onClose() {
    for (final callback in _disposeCallbacks) {
      callback();
    }
    super.onClose();
  }
}
