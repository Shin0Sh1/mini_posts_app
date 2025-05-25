import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
}
