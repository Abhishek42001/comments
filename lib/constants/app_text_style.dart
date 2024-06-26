import 'package:comments/constants/app_colors.dart';
import 'package:flutter/material.dart';

///It contains all the textstyles
///for the app
class AppTextStyles {
  AppTextStyles._();
  static final AppTextStyles _instance = AppTextStyles._();
  factory AppTextStyles() => _instance;

  static TextStyle defaultStyle = const TextStyle(
    color: primaryTextColor,
    fontFamily: 'Poppins',
  );

  static TextStyle txtStyle_20_700 = defaultStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtStyle_14_400 = defaultStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtStyle_14_700 = defaultStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtStyle_16_400 = defaultStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtStyle_16_700 = defaultStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
