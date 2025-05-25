import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_posts_app/core/domain/navigation/router.dart';
import 'package:mini_posts_app/core/utils/filter_posts.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_repository.dart';

class MainViewModel with ChangeNotifier {
  final PostRepository _postRepository;
  final BuildContext context;

  MainViewModel({required this.context, required PostRepository postRepository})
    : _postRepository = postRepository;

  final searchController = TextEditingController();

  bool isLoading = false;
  Object? error;

  final List<Post> _allPosts = [];
  String _filter = '';

  List<Post> get filteredPosts => filterPosts(_allPosts, _filter);

  Future<void> fetchPosts() async {
    try {
      final posts = await _postRepository.getPosts();
      _allPosts
        ..clear()
        ..addAll(posts);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }

  void onCardTapped(Post post) async {
    await context.push(AppRoutes.detailedPostPage, extra: post);
  }

  void _onSearchChanged() {
    setFilter(searchController.text);
  }

  void initState() {
    searchController.addListener(_onSearchChanged);
    fetchPosts();
  }

  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
  }
}
