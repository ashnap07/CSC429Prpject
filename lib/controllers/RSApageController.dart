import 'dart:typed_data';

import 'package:cryptography_system/cryptoAlgorithms/RSA.dart';
import 'package:cryptography_system/ForFile.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as p;

final storage = GetStorage();

class RSApageController extends GetxController {
  String? publicKey;
  String? privateKey;
  Uint8List? file1;
  Uint8List? file2;

  String file1StatusTitle = "Upload a file";
  String file2StatusTitle = "Upload a file";
  String path = "";

  resetFiles() {
    file1 = null;
    file2 = null;
    path = "";
    file1StatusTitle = "Upload a file";
    file2StatusTitle = "Upload a file";
    update();
  }

  generateKey() async {
    KeyPair keyPair = await RSALib.generateKey(numberOfBits: 1024);
    publicKey = keyPair.publicKey;
    privateKey = keyPair.privateKey;
    storage.write("publicKey", publicKey);
    storage.write("privateKey", privateKey);

    update();
  }

  readPublicKey() async {
    publicKey = await readFileAsStirng();
    if (publicKey == null) return;
    update();
  }

  readPrivateKey() async {
    privateKey = await readFileAsStirng();
    if (privateKey == null) return;

    update();
  }

  readFile1() async {
    var file = await readFile();
    if (file == null) return;
    path = p.basename(file.toString()).replaceAll("'", "");
    file1 = file.readAsBytesSync();
    if (file1 == null) return;
    file1StatusTitle = "Upload another file";
    update();
  }

  readFile2() async {
    var file = await readFile();
    if (file == null) return;
    path = p.basename(file.toString()).replaceAll("'", "");
    file2 = file.readAsBytesSync();
    if (file2 == null) return;
    file2StatusTitle = "Upload another file";
    update();
  }

  @override
  void onInit() {
    super.onInit();
    publicKey = storage.read("publicKey");
    privateKey = storage.read("privateKey");
  }
}
