import 'package:cryptography_system/router/routerName.dart';
import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgorund1,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.head,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Cryptography System",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 50,
                  color: AppColors.secondray,
                  fontWeight: FontWeight.bold,
                ),
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
            bulidOption(context, "RSA", () => {Get.toNamed(Routes.RSAPage)}),
            const SizedBox(
              height: 50,
            ),
            bulidOption(context, "AES", () => {Get.toNamed(Routes.AESPage)}),
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
                fontSize: 50,
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
