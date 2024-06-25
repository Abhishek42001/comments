import 'package:comments/config/widget_config.dart';
import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/models/comment_model.dart';
import 'package:comments/viewModel/comments_view_model.dart';
import 'package:comments/widgets/app_button.dart';
import 'package:comments/widgets/comment/comment_item.dart';
import 'package:comments/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommentsViewModel>(
      context,
      listen: false,
    ).getComments();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: primaryColor,
      ),
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 92,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(
                  bottom: 21,
                  left: 19,
                ),
                color: primaryColor,
                child: Text(
                  "Comments",
                  style:
                      AppTextStyles.txtStyle_14_700.copyWith(color: whiteColor),
                ),
              ),
              Consumer<CommentsViewModel>(
                builder: (BuildContext context, value, Widget? child) {
                  List<CommentModel>? commentModelList = value.commentModelList;

                  return Expanded(
                    child: value.isLoading
                        ? const Loader()
                        : commentModelList == null
                            ? Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: WidgetConfig().pagePadding.copyWith(
                                        top: 26,
                                      ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Some Error occured",
                                        style: AppTextStyles.txtStyle_20_700,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 16),
                                        child: AppButton(
                                          'Refresh',
                                          onTap: value.getComments,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : ListView.separated(
                                padding: WidgetConfig().pagePadding.copyWith(
                                      top: 26,
                                      bottom: 26,
                                    ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CommentItemWidget(
                                    commentModel: commentModelList[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 15,
                                  );
                                },
                                itemCount: commentModelList.length,
                              ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
