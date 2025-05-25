import 'package:flutter/widgets.dart';
import 'package:mini_posts_app/features/feedback/presentation/feedback_screen.dart';
import 'package:mini_posts_app/features/feedback/presentation/feedback_vm.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FeedbackViewModel(),
      child: FeedbackScreen(),
    );
  }
}
