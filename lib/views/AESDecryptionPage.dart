import 'dart:typed_data';
import 'package:cryptography_system/controllers/AESPageController.dart';
import 'package:cryptography_system/cryptoAlgorithms/AES.dart';
import 'package:cryptography_system/ForFile.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/HelperClass/ForKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HelperClass/ForUpload.dart';
import 'HelperClass/ForButtons.dart';

class AESDecryptionPage extends StatelessWidget {
  AESDecryptionPage({super.key});

  final AESPageController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgorund1,
        ),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.head,
              ),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () => {Get.offNamed(Routes.AESPage)},
                    child: Icon(
                      size: 50,
                      Icons.arrow_back_ios,
                      color: AppColors.secondray,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cryptography System",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 50,
                      color: AppColors.secondray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " - AES - Decryption",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 50,
                      color: AppColors.secondray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            const SizedBox(
              height: 100,
            ),
            GetBuilder<AESPageController>(builder: (context) {
              return Column(
                children: [
                  ForKeys(
                    title: "Key",
                    content: _controller.keyString == null
                        ? "N\\A"
                        : "${_controller.keyString!.substring(0, 15)}...",
                    icon1: Icons.file_upload_outlined,
                    onTap1: () {
                      if (_controller.keyString == null) {
                        Get.snackbar(
                          "Error",
                          "There is no key.",
                          colorText: Colors.white,
                        );
                        return;
                      }

                      writeFileAsString(
                        name: "Key.aes",
                        str: _controller.keyString!,
                      );
                    },
                    icon2: Icons.file_download_outlined,
                    onTap2: () async {
                      String? keySting = await readFileAsStirng();
                      if (keySting == null) return;
                      _controller.readKey(keySting);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ForKeys(
                    title: "IV",
                    content: _controller.ivString == null
                        ? "N\\A"
                        : "${_controller.ivString!.substring(0, 15)}...",
                    icon1: Icons.file_upload_outlined,
                    onTap1: () {
                      if (_controller.ivString == null) {
                        Get.snackbar(
                          "Error",
                          "There is no iv.",
                          colorText: Colors.white,
                        );
                        return;
                      }
                      writeFileAsString(
                        name: "_IV",
                        str: _controller.ivString!,
                      );
                    },
                    icon2: Icons.file_download_outlined,
                    onTap2: () async {
                      String? file = await readFileAsStirng();
                      if (file == null) return;
                      _controller.readIv(file);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: Get.width * 0.7),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.buttons,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.vpn_key_rounded,
                    color: AppColors.secondray,
                  ),
                  onPressed: () async {
                    await _controller.generateKey();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.3),
              child: GetBuilder<AESPageController>(builder: (_) {
                return ForUpload(
                    statusTitle: _controller.file1StatusTitle,
                    onTap: () {
                      _controller.readFile1();
                    });
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            ForButtons(
              title: "Decrypt & Download",
              onTap: () async {
                if (_controller.file1 == null ||
                    _controller.key == null ||
                    _controller.iv == null) {
                  Get.snackbar(
                    "Error",
                    "The is no file or key or iv .",
                    colorText: Colors.white,
                  );
                  return;
                }
                var before = DateTime.now();
                Uint8List ciphertext = MyAES.decrypt(
                  key: _controller.key!,
                  iv: _controller.iv!,
                  cipherText: _controller.file1!,
                );
                var dif = DateTime.now().difference(before);
                print("======== $dif ========");
                writeFile(
                  name: "plaintext.txt",
                  str: ciphertext,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
