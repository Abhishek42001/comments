import 'package:comments/config/widget_config.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/widgets/app_button.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String errorText;
  final VoidCallback onRefreshTap;

  const AppErrorWidget({
    this.errorText='Some Error occured',
    required this.onRefreshTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: WidgetConfig().pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: AppTextStyles.txtStyle_20_700,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: AppButton(
                'Refresh',
                onTap: onRefreshTap,
              ),
            )
          ],
        ),
      );
  }
}
