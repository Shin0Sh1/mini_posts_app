import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_posts_app/core/presentation/bottom_nav_bar.dart';
import 'package:mini_posts_app/features/feedback/presentation/feedback_page.dart';
import 'package:mini_posts_app/features/mini_posts/data/model/post.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/detailed_post_page/detailed_post_page.dart';
import 'package:mini_posts_app/features/mini_posts/presentation/main_page/main_page.dart';

class AppRoutes {
  static final _sectionNavigatorMainPageKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorFeedbackKey = GlobalKey<NavigatorState>();

  static const mainPage = '/main_page';
  static const detailedPostPage = '/detailed_post';
  static const feedbackPage = '/feedback';

  static final routes = GoRouter(
    initialLocation: AppRoutes.mainPage,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) => BottomNavBar(navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorMainPageKey,
            routes: [
              GoRoute(
                path: AppRoutes.mainPage,
                builder: (context, state) => const MainPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorFeedbackKey,
            routes: [
              GoRoute(
                path: AppRoutes.feedbackPage,
                builder: (context, state) => FeedbackPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.detailedPostPage,
        builder: (context, state) {
          final post = state.extra as Post;
          return DetailedPostPage(post: post);
        },
      ),
    ],
  );
}
