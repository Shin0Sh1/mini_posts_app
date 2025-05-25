import 'package:flutter/material.dart';
import 'package:mini_posts_app/core/domain/di/di_container.dart';
import 'package:mini_posts_app/core/domain/navigation/router.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_repository.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/main_vm.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoutes.routes);
  }
}
