import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/iot_pannel/presentation/proviers/iot_provider.dart';
import 'package:iot_isra_app/utils/logger.dart';


 
class IotDeviceCard extends ConsumerStatefulWidget {
  final IconData icon;
  final String label;
  final String nombre;  
  final Widget? extra;

  const IotDeviceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.nombre,
    this.extra,
  });

  @override
  ConsumerState<IotDeviceCard> createState() => _IotDeviceCardState();
}

class _IotDeviceCardState extends ConsumerState<IotDeviceCard> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    _loadInitialState();
  }

  void _loadInitialState() async {
    final bool estadoInicial = await ref.read(dispositivoEstadoProvider(widget.nombre).future);
    setState(() => isOn = estadoInicial);
  }

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
            onChanged: (v) async {
              final useCase = ref.read(updateDeviceStatusUseCaseProvider);
              try {
                final nombreAjustado = widget.nombre.replaceAll(' ', '_');
                await useCase(nombreAjustado, v);
                setState(() => isOn = v);
              } catch (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al actualizar dispositivo')),
                );
              }
            },
            activeColor: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}
