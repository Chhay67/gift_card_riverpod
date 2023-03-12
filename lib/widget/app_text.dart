import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/app_color.dart';

class AppText extends Text {
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  AppText.title(String data,
      {super.key,
        this.color = AppColors.primary,
        this.fontWeight = FontWeight.bold,
        this.fontSize = 26})
      : super(data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp));
  AppText.large(String data,
      {super.key,
        this.color = AppColors.primary,
        this.fontWeight = FontWeight.w600,
        this.fontSize = 24})
      : super(data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp));
  AppText.medium(String data,
      {super.key,
        this.color = AppColors.primary,
        this.fontWeight = FontWeight.bold,
        this.fontSize = 14})
      : super(data,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp));
  AppText.small(String data,
      {super.key,
        this.color = AppColors.primary,
        this.fontWeight = FontWeight.normal,
        this.fontSize = 12})
      : super(data,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp));
}
