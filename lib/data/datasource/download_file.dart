import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // bool status;

    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      await Permission.photos.request().isGranted;
    } else {
      await Permission.storage.request().isGranted;
    }

    Directory directory = Directory("dir");
    if (Platform.isAndroid) {
      directory = Directory("/storage/emulated/0/Download/PML SHIP");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    log("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> downloadAndSaveFile(String url) async {
    var uriURL = Uri.parse(url);
    var response = await http.get(uriURL);
    Uint8List bytes = response.bodyBytes;

    // Generate a timestamp for the filename
    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

    String originalFileName = uriURL.pathSegments.last;
// Extract the filename without the extension
    String fileNameWithoutExtension = originalFileName.split('.').first;

// Extract the file extension
    String fileExtension = originalFileName.split('.').last;
    // Construct the new filename with the timestamp
    String newFileName =
        '${fileNameWithoutExtension}_$timestamp.$fileExtension';

    String filePath = join(await _localPath, newFileName);
    File file = File(filePath);

    try {
      if (await file.exists()) {
        // If the file exists, delete it before writing the new data
        await file.delete();
      }

      await file.writeAsBytes(bytes, flush: true);
      log('File saved to: $filePath');
      return file; // Move the return statement inside the try block
    } catch (e) {
      log('Error saving File: $e');
      rethrow; // Rethrow the exception to handle it elsewhere if needed
    }
  }
}
