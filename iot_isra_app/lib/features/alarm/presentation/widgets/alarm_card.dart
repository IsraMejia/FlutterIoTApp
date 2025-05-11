import 'package:flutter/material.dart';

class AlarmCard extends StatefulWidget {
  final String timeLabel;
  final bool initialState;

  const AlarmCard({
    super.key,
    required this.timeLabel,
    required this.initialState,
  });

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.timeLabel,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
                // En un futuro aquí irá el POST al backend con el nuevo estado
              });
            },
            activeColor:  const Color.fromARGB(255, 86, 194, 127),
            inactiveThumbColor: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
