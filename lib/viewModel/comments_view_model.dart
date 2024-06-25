import 'package:comments/models/comment_model.dart';
import 'package:comments/repository/comments_repository.dart';
import 'package:flutter/material.dart';

class CommentsViewModel with ChangeNotifier {
  bool isLoading = false;
  CommentsRepository commentsRepository = CommentsRepository();
  List<CommentModel>? commentModelList;

  Future<void> getComments() async {
    isLoading = true;
    notifyListeners();
    commentModelList = await commentsRepository.getComments();
    isLoading = false;
    notifyListeners();
  }
}
