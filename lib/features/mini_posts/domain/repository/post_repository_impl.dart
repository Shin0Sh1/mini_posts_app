import 'package:mini_posts_app/core/domain/exception/post_fetch_exception.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';
import 'package:mini_posts_app/features/mini_posts/data/source/post_data_source.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_repository.dart';
import 'package:dio/dio.dart';

class PostRepositoryImpl extends PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl({required PostDataSource postDataSource})
    : _postDataSource = postDataSource;

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await _postDataSource.getPosts();
      final statusCode = response.response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        return response.data;
      } else if (statusCode == 204) {
        return [];
      } else {
        throw PostFetchException(
          message: 'Ошибка при получении постов',
          statusCode: statusCode,
          details: response.response.data,
        );
      }
    } on DioException catch (e) {
      throw PostFetchException(
        message: 'Сетевая ошибка',
        statusCode: e.response?.statusCode,
        details: e.response?.data,
      );
    }
  }

  @override
  Future<Post> getPost(int id) async {
    try {
      final response = await _postDataSource.getPost(id);
      final statusCode = response.response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        return response.data;
      } else {
        throw PostFetchException(
          message: 'Ошибка при получении поста',
          statusCode: statusCode,
          details: response.response.data,
        );
      }
    } on DioException catch (e) {
      throw PostFetchException(
        message: 'Сетевая ошибка',
        statusCode: e.response?.statusCode,
        details: e.response?.data,
      );
    }
  }
}
