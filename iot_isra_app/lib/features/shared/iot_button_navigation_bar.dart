import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class IotButtonNavigationBar extends ConsumerWidget {
  const IotButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 1, 1, 5),
      selectedItemColor: const Color.fromARGB(255, 86, 194, 127),
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => ref.read(currentIndexProvider.notifier).state = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: 'Alarma',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined ),
          label: 'Inicio',
        ),
      ],
    );
  }
}
