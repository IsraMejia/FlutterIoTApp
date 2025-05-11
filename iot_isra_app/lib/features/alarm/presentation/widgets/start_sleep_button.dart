import 'package:flutter/material.dart';

class StartSleepButton extends StatefulWidget {
  const StartSleepButton({super.key});

  @override
  State<StartSleepButton> createState() => _StartSleepButtonState();
}

class _StartSleepButtonState extends State<StartSleepButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: const Text(
              'Iniciar registro de sueño',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 14),
            const Text(
              'Tiempo aproximado de sueño: 8 horas',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ciclos de sueño aproximados: 5',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
