import 'package:cryptography_system/controllers/AESPageController.dart';

import 'package:cryptography_system/ForFile.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/HelperClass/ForKeys.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AESPage extends StatelessWidget {
  AESPage({super.key});

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
                    onTap: () => {Get.offAllNamed(Routes.homepage)},
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
                    " - AES",
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
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bulidOption(context, "Encryption", () {
                  _controller.resetFiles();
                  return Get.toNamed(Routes.AESEncryptionPage);
                }),
                bulidOption(context, "Decryption", () {
                  _controller.resetFiles();
                  return Get.toNamed(Routes.AESDecryptionPage);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

InkWell bulidOption(BuildContext context, String title, ontap()) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Container(
      width: Get.width * 0.2,
      decoration: BoxDecoration(
          color: AppColors.buttons,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.buttonsBordar, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: AppColors.secondray,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.secondray,
          )
        ],
      ),
    ),
  );
}
