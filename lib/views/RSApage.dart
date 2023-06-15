import 'package:cryptography_system/controllers/RSApageController.dart';
import 'package:cryptography_system/ForFile.dart';
import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:cryptography_system/views/HelperClass/ForKeys.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RSAPage extends StatelessWidget {
  RSAPage({super.key});

  final RSApageController _controller = Get.find();
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
                    " - RSA",
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
            GetBuilder<RSApageController>(
              builder: (context) {
                return Column(
                  children: [
                    ForKeys(
                      title: "Public key",
                      content: _controller.publicKey == null
                          ? "N\\A"
                          : "${extractKey(key: _controller.publicKey!, public: true)}...",
                      icon1: Icons.file_upload_outlined,
                      onTap1: () {
                        if (_controller.publicKey == null) return;
                        writeFileAsString(
                          name: "publicKey.pem",
                          str: _controller.publicKey!,
                        );
                      },
                      icon2: Icons.file_download_outlined,
                      onTap2: () {
                        _controller.readPublicKey();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ForKeys(
                      title: "Private key",
                      content: _controller.privateKey == null
                          ? "N\\A"
                          : "${extractKey(key: _controller.privateKey!, public: false)}...",
                      icon1: Icons.file_upload_outlined,
                      onTap1: () {
                        if (_controller.privateKey == null) return;
                        writeFileAsString(
                          name: "privateKey.pem",
                          str: _controller.privateKey!,
                        );
                      },
                      icon2: Icons.file_download_outlined,
                      onTap2: () {
                        _controller.readPrivateKey();
                      },
                    ),
                  ],
                );
              },
            ),
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
                bulidOption(context, "Signing", () {
                  _controller.resetFiles();
                  return Get.toNamed(Routes.RSASigningPage);
                }),
                bulidOption(
                  context,
                  "Verifying",
                  () {
                    _controller.resetFiles();
                    return Get.toNamed(Routes.RSAVerifyingPage);
                  },
                ),
                bulidOption(
                  context,
                  "Encryption",
                  () {
                    _controller.resetFiles();
                    return Get.toNamed(Routes.RSAEncryptionPage);
                  },
                ),
                bulidOption(
                  context,
                  "Decryption",
                  () {
                    _controller.resetFiles();
                    return Get.toNamed(Routes.RSADecryptionPage);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

extractKey({required String key, required bool public}) {
  if (public) {
    return key
        .replaceAll(RegExp("-----BEGIN RSA PUBLIC KEY-----"), "")
        .replaceAll(RegExp("-----END RSA PUBLIC KEY-----"), "")
        .substring(1, 12);
  } else {
    return key
        .replaceAll(RegExp("-----BEGIN RSA PRIVATE KEY-----"), "")
        .replaceAll(RegExp("-----END RSA PRIVATE KEY-----"), "")
        .substring(1, 12);
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
