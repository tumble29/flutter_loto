import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

class FileUtils {
  static Future<ShareResultStatus> shareImage(Uint8List file) async {
    final result = await Share.shareXFiles(
        [XFile.fromData(file, mimeType: "image/png", name: "Phiếu lô tô.png")]);
    return result.status;
  }
}
