import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_alarm_providers.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_new_alarm.dart';
import 'package:intl/intl.dart';
import 'package:iot_isra_app/utils/logger.dart';

class AlertDialogSetAlarm extends ConsumerStatefulWidget {
  const AlertDialogSetAlarm({super.key});

  @override
  ConsumerState<AlertDialogSetAlarm> createState() => _AlertDialogSetAlarmState();
}

class _AlertDialogSetAlarmState extends ConsumerState<AlertDialogSetAlarm> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 13, 0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Añadir alarma',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  backgroundColor: Colors.transparent,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false,
                  onDateTimeChanged: (DateTime newTime) {
                    _selectedTime = newTime;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      ref.read(showAlarmDialogProvider.notifier).state = false;
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Guardar', style: TextStyle(color: Colors.white)),
                    onPressed: () async{
                      // final formatted = DateFormat.jm().format(_selectedTime);
                      final formatted = DateFormat('HH:mm:ss').format(_selectedTime);


                      try {
                        // 1. Guardar localmente
                        ref.read(alarmListProvider.notifier).addAlarm(formatted);
                        logger.d("Se guardo la localmente la alarma $formatted");
                        // 2. Hacer POST al backend
                        final configurarAlarma = ref.read(configurarAlarmaUseCaseProvider);
                        logger.d("Se inicia la peticion para guardarla en el servidor ");
                        await configurarAlarma(formatted);
                        // 3. Cerrar diálogo
                        logger.d("Se termino la peticion");
                        ref.read(showAlarmDialogProvider.notifier).state = false;
                      } catch (e) {
                        debugPrint('Error al configurar alarma: $e');
                        // Puedes mostrar un error visual si quieres
                      }
                       
                      ref.read(showAlarmDialogProvider.notifier).state = false;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
