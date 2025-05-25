import 'package:flutter/material.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/main_vm.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/widgets/post_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final _vm = context.read<MainViewModel>();

  @override
  void initState() {
    _vm.initState();
    super.initState();
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Posts')),
      body: Consumer<MainViewModel>(
        builder:
            (context, vm, _) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: vm.searchController,
                    decoration: InputDecoration(
                      hintText: 'Фильтр по заголовку',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (vm.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (vm.error != null) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Ошибка загрузки'),
                              ElevatedButton(
                                onPressed: vm.fetchPosts,
                                child: const Text('Повторить'),
                              ),
                            ],
                          ),
                        );
                      }

                      final posts = vm.filteredPosts;
                      return ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: 16),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        itemCount: posts.length,
                        itemBuilder: (_, i) {
                          final post = posts[i];
                          return PostCard(
                            post: post,
                            onTap: (post) => _vm.onCardTapped(post),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
