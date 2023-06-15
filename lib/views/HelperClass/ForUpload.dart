import 'package:cryptography_system/style.dart';
import 'package:flutter/material.dart';

class ForUpload extends StatelessWidget {
  const ForUpload({
    super.key,
    required this.onTap,
    required this.statusTitle,
    this.isHalf = false,
    this.subTitle,
  });
  final Function()? onTap;
  final String statusTitle;
  final bool isHalf;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              statusTitle,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 40,
              ),
            ),
            subTitle != null
                ? Text(
                    subTitle!,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
