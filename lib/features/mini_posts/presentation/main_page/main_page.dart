import 'package:flutter/material.dart';
import 'package:mini_posts_app/core/domain/di/di_container.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_repository.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/main_screen.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/main_vm.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => MainViewModel(
            context: context,
            postRepository: getIt.get<PostRepository>(),
          ),
      child: const MainScreen(),
    );
  }
}
