import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;

  const AppButton(
    this.title, {
    required this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    color: whiteColor,
                    strokeWidth: 4,
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    style: AppTextStyles.txtStyle_16_700.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
