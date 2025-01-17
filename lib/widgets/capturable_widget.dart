import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '/utils/utils.dart';

class CapturableWidget {
  final Widget child;
  final controller = ScreenshotController();
  bool canBeCaptured = true;
  CapturableWidget({required this.child});

  Widget getChild() {
    canBeCaptured = true;
    return Screenshot(controller: controller, child: child);
  }

  Future<Uint8List?> capture() async {
    if (!canBeCaptured) return null;
    return await controller.capture();
  }

  void shareWidgetPhoto() async {
    final image = await capture();
    if (image != null) {
      FileUtils.shareImage(image);
    }
  }
}
