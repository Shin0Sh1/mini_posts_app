import 'package:flutter/material.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final void Function(Post post)? onTap;

  const PostCard({super.key, required this.post, this.onTap});

  @override
  State<PostCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<PostCard> {
  Widget _contentBuilder(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Center(
          child: Text(
            widget.post.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8),
        Center(child: const Divider()),
        const SizedBox(height: 8),
        Text(widget.post.body, style: Theme.of(context).textTheme.bodyLarge),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(widget.post),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.secondaryContainer.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [],
        ),
        child: _contentBuilder(context),
      ),
    );
  }
}
