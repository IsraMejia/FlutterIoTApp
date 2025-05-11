import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';

final showAlarmDialogProvider = StateProvider<bool>((ref) => false);

// Lista de alarmas dinámicas
final alarmListProvider = StateNotifierProvider<AlarmListNotifier, List<AlarmModel>>(
  (ref) => AlarmListNotifier(),
);

class AlarmListNotifier extends StateNotifier<List<AlarmModel>> {
  AlarmListNotifier() : super([]);

  void addAlarm(String formattedTime) {
    final newAlarm = AlarmModel(timeLabel: formattedTime, isActive: true);
    state = [...state, newAlarm];
  }

  //Actualiza el estado de la alarma podriamos decir que la activa o desactica
  void toggleAlarm(int index, bool value) {
    final updated = state[index];
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          AlarmModel(timeLabel: updated.timeLabel, isActive: value)
        else
          state[i],
    ];
  }
}
