import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBar(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
          unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: const Icon(Icons.description_outlined),
              ),
              activeIcon: Container(
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.description,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              label: 'Посты',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: const Icon(Icons.feedback_outlined),
              ),
              activeIcon: Container(
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.feedback_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              label: 'Обратная связь',
            ),
          ],
          onTap: _onTap,
        ),
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
