import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'post_data_source.g.dart';

@RestApi()
abstract class PostDataSource {
  factory PostDataSource(Dio dio) = _PostDataSource;

  @GET('/posts')
  Future<HttpResponse<List<Post>>> getPosts();

  @GET('/posts/{id}')
  Future<HttpResponse<Post>> getPost(@Path() int id);
}
