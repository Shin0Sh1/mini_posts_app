import 'package:flutter/material.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/detailed_post_page/detailed_post_screen.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/detailed_post_page/detailed_post_vm.dart';
import 'package:provider/provider.dart';

class DetailedPostPage extends StatelessWidget {
  final Post post;
  const DetailedPostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => DetailedPostViewModel(post: post),
      child: DetailedPostScreen(),
    );
  }
}
