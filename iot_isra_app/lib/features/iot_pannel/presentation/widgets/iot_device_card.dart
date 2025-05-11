import 'package:flutter/material.dart';

class IotDeviceCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final Widget? extra;

  const IotDeviceCard({
    super.key,
    required this.icon,
    required this.label,
    this.extra,
  });

  @override
  State<IotDeviceCard> createState() => _IotDeviceCardState();
}

class _IotDeviceCardState extends State<IotDeviceCard> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.icon, size: 38, color: Colors.white70),
          const SizedBox(height: 8),
          Text(widget.label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          if (widget.extra != null) widget.extra!,
          Switch(
            value: isOn,
            onChanged: (v) => setState(() => isOn = v),
            activeColor: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}
