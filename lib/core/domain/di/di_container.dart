import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_posts_app/core/domain/navigation/router.dart';
import 'package:mini_posts_app/features/mini_posts/data/source/post_data_source.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_Repository_impl.dart';
import 'package:mini_posts_app/features/mini_posts/domain/repository/post_repository.dart';

final getIt = GetIt.instance;

void setup() {
  GoRouter initRouter() => AppRoutes.routes;

  getIt.registerSingleton(initRouter());

  final dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
  );

  getIt.registerSingleton<PostDataSource>(PostDataSource(dio));

  getIt.registerSingleton<PostRepository>(
    PostRepositoryImpl(postDataSource: getIt.get<PostDataSource>()),
  );
}
