import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_new_alarm.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/alarm_card.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/alert_dialog_set_alarm.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/new_alarm.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/start_sleep_button.dart';
import 'package:iot_isra_app/utils/logger.dart';


class AlarmScreen extends ConsumerWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDialog = ref.watch(showAlarmDialogProvider);
    final alarmList = ref.watch(alarmListProvider);

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alarmas',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const NewAlarmButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        for (int i = 0; i < alarmList.length; i++)
                          AlarmCard(
                            timeLabel: alarmList[i].hora,
                            isActive: alarmList[i].activa,
                            onToggle: () {
                              logger.d("Desactivando/Activando Alarma");
                              ref.read(alarmListProvider.notifier).toggleAlarm(
                                    i,
                                    !alarmList[i].activa,
                                  );
                              logger.d("Desactivando/Activando Alarma listo ✅");

                            },
                          ),
                        if (alarmList.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 80),
                            child: Text(
                              'No hay alarmas definidas.',
                              style: TextStyle(color: Colors.white54, fontSize: 18),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: StartSleepButton(),
                ),
              ],
            ),
          ),
          if (showDialog) const AlertDialogSetAlarm(),
        ],
      ),
    );
  }
}
