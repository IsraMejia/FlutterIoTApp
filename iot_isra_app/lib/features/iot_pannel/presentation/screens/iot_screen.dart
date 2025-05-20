import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_isra_app/features/alarm/presentation/screens/alarm_screen.dart';
import 'package:iot_isra_app/features/iot_pannel/presentation/widgets/iot_device_card.dart';
import 'package:iot_isra_app/features/iot_pannel/presentation/widgets/temperatura_card.dart'; 
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
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Domótica',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 1,),
              SizedBox(
                height: screenHeight * 0.55,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                 children: const [
                    IotDeviceCard(
                      icon: Icons.air_rounded,
                      label: 'Ventilador',
                      nombre: 'Ventilador',
                    ),
                    IotDeviceCard(
                      icon: Icons.door_back_door_sharp,
                      label: 'Puerta',
                      nombre: 'Puerta',
                    ),
                    IotDeviceCard(
                      icon: Icons.local_drink,
                      label: 'Servir Agua',
                      nombre: 'Servir_Agua',
                    ),
                    IotDeviceCard(
                      icon: Icons.sanitizer,
                      label: 'Atomizador',
                      nombre: 'Atomizador',
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 1,),
            
            ],
          ),
        ),
      ),
    );
  }
} 