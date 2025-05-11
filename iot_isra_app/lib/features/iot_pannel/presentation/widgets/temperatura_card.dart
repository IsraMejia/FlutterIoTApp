import 'package:flutter/material.dart';

class TemperaturaCard extends StatelessWidget {
  const TemperaturaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.thermostat, size: 38, color: Colors.white70),
          SizedBox(height: 8),
          Text('Temperatura', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 4),
          Text('23°', style: TextStyle(color: Colors.cyanAccent, fontSize: 20)),
        ],
      ),
    );
  }
}
