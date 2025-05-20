import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  final String timeLabel;
  final bool isActive;
  final VoidCallback onToggle;

  const AlarmCard({
    super.key,
    required this.timeLabel,
    required this.isActive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            timeLabel.substring(0, 5),
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (_) => onToggle(),
            activeColor: const Color.fromARGB(255, 86, 194, 127),
            inactiveThumbColor: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
