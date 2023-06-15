import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography_system/cryptoAlgorithms/AES.dart';
import 'package:cryptography_system/ForFile.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class AESPageController extends GetxController {
  Key? key;
  String? keyString;
  IV? iv;
  String? ivString;
  Uint8List? file1;
  String file1StatusTitle = "Upload a file";
  resetFiles() {
    file1 = null;
    file1StatusTitle = "Upload a file";
    update();
  }

  generateKey() {
    keyString = getRandomString(32);
    key = MyAES.generateKey(keyString: keyString!);
    ivString = getRandomString(16);
    iv = MyAES.generateIV(ivString: ivString!);
    storage.write("AESkeyString", keyString);
    storage.write("AESivString", ivString);
    update();
  }

  readKey(String str) {
    keyString = str;
    key = MyAES.generateKey(keyString: keyString!);
    update();
  }

  readIv(String str) {
    ivString = str;
    iv = MyAES.generateIV(ivString: ivString!);
    update();
  }

  readFile1() async {
    file1 = await readFile();
    if (file1 == null) return;
    file1StatusTitle = "Upload another file";
    update();
  }

  @override
  void onInit() {
    super.onInit();
    keyString = storage.read("AESkeyString");
    if (keyString == null) {
      generateKey();
      return;
    }
    key = MyAES.generateKey(keyString: keyString!);

    ivString = storage.read("AESivString");
    if (ivString == null) {
      generateKey();
    }
    iv = MyAES.generateIV(ivString: ivString!);
  }
}

//Start: Just to generate a random string
var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
// end
