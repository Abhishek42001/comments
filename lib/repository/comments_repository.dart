import 'package:comments/constants/api_endpoints.dart';
import 'package:comments/models/comment_model.dart';
import 'package:comments/services/network_layer.dart';
import 'package:dio/dio.dart';

class CommentsRepository{
  Future<List<CommentModel>?> getComments() async {
    try {
      Response response = await NetworkLayer().client.get(ApiEndpoints().comment);
      List<CommentModel> comments = (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
      return comments;
    } on DioException catch(e){
      ///We can handle dio exception if we want
      return null;
    }
    on Exception catch (_) {
      return null;
    }
  }
}