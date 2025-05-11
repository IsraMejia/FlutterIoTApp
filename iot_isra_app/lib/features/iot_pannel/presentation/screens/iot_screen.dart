import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/screens/alarm_screen.dart'; 
import 'package:iot_isra_app/features/shared/iot_button_navigation_bar.dart';

class IotScreen extends ConsumerWidget {
  const IotScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentIndexProvider);

    final screens = [
      const AlarmScreen(),
      const _IotHomeScreen(),
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: const IotButtonNavigationBar(),
    );
  }
}

class _IotHomeScreen extends StatelessWidget {
  const _IotHomeScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pantalla principal IoT',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
