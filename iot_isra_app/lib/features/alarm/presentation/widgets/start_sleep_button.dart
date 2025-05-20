import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_new_alarm.dart';

class StartSleepButton extends ConsumerStatefulWidget {
  const StartSleepButton({super.key});

  @override
  ConsumerState<StartSleepButton> createState() => _StartSleepButtonState();
}

class _StartSleepButtonState extends ConsumerState<StartSleepButton> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  String? tiempoSueno;
  int? ciclos;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.55,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
  }

  void _recalcularSueno() {
    final alarmList = ref.read(alarmListProvider);
    final now = DateTime.now();

    final alarmasActivas = alarmList.where((a) => a.activa).toList();
    if (alarmasActivas.isEmpty) return;

    final alarmasOrdenadas = alarmasActivas.map((a) {
      final partes = a.hora.split(':').map(int.parse).toList();
      var dt = DateTime(
        now.year,
        now.month,
        now.day,
        partes[0],
        partes[1],
      );
      if (dt.isBefore(now)) {
        dt = dt.add(const Duration(days: 1));
      }
      return dt;
    }).toList()
      ..sort();

    final proximaAlarma = alarmasOrdenadas.first;
    final duracion = proximaAlarma.difference(now);
    final minutos = duracion.inMinutes;
    final horas = minutos ~/ 60;
    final minRestantes = minutos % 60;
    final ciclosEstimados = minutos ~/ 90;

    setState(() {
      isExpanded = true;
      tiempoSueno = '$horas horas con $minRestantes min';
      ciclos = ciclosEstimados;
    });
  }

  void _onTap() {
    _controller.forward(from: 0.95);
    _recalcularSueno();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Iniciar registro de sueño',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isExpanded && tiempoSueno != null && ciclos != null) ...[
                const SizedBox(height: 14),
                Text(
                  'Tiempo aproximado de sueño: $tiempoSueno',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Ciclos de sueño aproximados: $ciclos',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
 