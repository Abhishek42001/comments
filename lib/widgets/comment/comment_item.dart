import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/models/comment_model.dart';
import 'package:comments/services/remote_config_service.dart';
import 'package:flutter/material.dart';

class CommentItemWidget extends StatelessWidget {
  final CommentModel commentModel;

  const CommentItemWidget({
    required this.commentModel,
    super.key,
  });

  String? maskEmail(String? email) {
    if (email == null) return null;

    /// Split email address
    List<String> parts = email.split('@');

    /// Keep the first part (username) as is if it's 3 characters or less
    String masked = parts.first.length <= 3
        ? parts.first
        : parts.first.substring(0, 3) + '*' * (parts.first.length - 3);

    /// Recreate the email with the masked part
    return '$masked@${parts.last}';
  }

  String? get name => commentModel.name;
  String? get email {
    if (FirebaseRemoteConfigService().shouldMaskEmail) {
      return maskEmail(commentModel.email);
    }
    return commentModel.email;
  }

  String? get body => commentModel.body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      height: 150,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (name != null && name != '')
            Container(
              height: 46,
              width: 46,
              decoration: const BoxDecoration(
                color: lightGray,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name![0].toUpperCase(),
                  style: AppTextStyles.txtStyle_16_700,
                ),
              ),
            ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: name != null ? 13 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Name: ',
                      style: AppTextStyles.txtStyle_16_400.copyWith(
                        color: lightGray,
                        fontStyle: FontStyle.italic,
                      ),
                      children: [
                        TextSpan(
                          text: name,
                          style: AppTextStyles.txtStyle_16_700.copyWith(
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: name != null ? 1 : 0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'Email: ',
                        style: AppTextStyles.txtStyle_16_400.copyWith(
                          color: lightGray,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text: email,
                            style: AppTextStyles.txtStyle_16_700.copyWith(
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (body != null)
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: email != null ? 5 : 0),
                        child: Text(
                          body!,
                          style: AppTextStyles.txtStyle_14_400
                              .copyWith(height: 1.2),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
