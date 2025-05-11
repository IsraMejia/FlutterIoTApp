import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_new_alarm.dart';
import 'package:intl/intl.dart';

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
                    onPressed: () {
                      final formatted = DateFormat.jm().format(_selectedTime);
                      ref.read(alarmListProvider.notifier).addAlarm(formatted);
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
