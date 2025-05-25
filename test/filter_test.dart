import 'package:flutter_test/flutter_test.dart';
import 'package:mini_posts_app/core/utils/filter_posts.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';

void main() {
  test('filterPosts возвращает только совпадающие заголовки', () {
    final posts = [
      Post(userId: 1, id: 1, title: 'Test', body: '...'),
      Post(userId: 1, id: 2, title: 'Test 2', body: '...'),
    ];

    final result = filterPosts(posts, '2');

    expect(result.length, 1);
    expect(result.first.id, 2);
  });

  test('filterPosts возвращает все при пустом запросе', () {
    final posts = [
      Post(userId: 2, id: 1, title: 'Hello', body: '...'),
      Post(userId: 2, id: 2, title: 'world', body: '...'),
      Post(userId: 2, id: 2, title: 'Post', body: '...'),
      Post(userId: 2, id: 2, title: 'Title', body: '...'),
    ];

    final result = filterPosts(posts, '');

    expect(result.length, 4);
  });
}
