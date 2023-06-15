import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

readFile() async {
  var result = await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result == null) return;
  File filePath = File(result.files.first.path!);
  return filePath;
}

readFileAsStirng() async {
  var result = await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result == null) return;

  File filePath = File(result.files.first.path!);
  return filePath.readAsString();
}

writeFile({required String name, required Uint8List str}) async {
  var f = await FilePicker.platform.saveFile(fileName: name);
  if (f == null) return;
  var file = File(f);
  if (await file.exists()) {
    Get.snackbar(
      "Error",
      "File name already exists. Please choose a different name.",
      colorText: Colors.white,
    );
    return;
  }
  File(f).writeAsBytesSync(str);
}

writeFileAsString({required String name, required String str}) async {
  var f = await FilePicker.platform.saveFile(fileName: name);
  if (f == null) return;
  File(f).writeAsStringSync(str);
}
