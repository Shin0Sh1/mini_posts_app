import 'package:flutter/material.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/detailed_post_page/detailed_post_vm.dart';
import 'package:provider/provider.dart';

class DetailedPostScreen extends StatefulWidget {
  const DetailedPostScreen({super.key});

  @override
  State<DetailedPostScreen> createState() => _DetailedPostScreenState();
}

class _DetailedPostScreenState extends State<DetailedPostScreen> {
  late final _vm = context.read<DetailedPostViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${_vm.post.id}'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                _vm.post.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 12),
            Divider(color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 12),
            Text(
              _vm.post.body,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
