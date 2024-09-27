import 'package:appbar/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.title,
    required this.onTap,
    this.titleColor,
    this.btnColor,
    this.strokeColor,
    this.width,
    this.height,
    super.key,
  });
  final VoidCallback onTap;
  final String title;
  final double? width, height;
  final Color? titleColor, strokeColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? deviceSize.width,
        height: height ?? 55,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: btnColor ?? AppColors.primaryBlue,
            border: Border.all(
                color: strokeColor ?? Colors.transparent, width: 1.0)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: titleColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
