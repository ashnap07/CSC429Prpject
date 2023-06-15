import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForKeys extends StatelessWidget {
  const ForKeys({
    super.key,
    required this.title,
    required this.content,
    required this.icon1,
    required this.onTap1,
    required this.icon2,
    required this.onTap2,
  });
  final String title;
  final String content;
  final IconData icon1;
  final Function()? onTap1;
  final IconData icon2;
  final Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: Get.width * 0.7),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xffEBEDEE),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: Get.width * 0.20,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$title: $content",
                  style: TextStyle(color: AppColors.primary, fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: onTap1,
                          icon: Icon(
                            Icons.file_download_outlined,
                            color: AppColors.buttons,
                          )),
                      Text(
                        "Download ",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.buttons),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: onTap2,
                          icon: Icon(
                            Icons.file_upload_outlined,
                            color: AppColors.buttons,
                          )),
                      Text(
                        " Upload",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.buttons),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
