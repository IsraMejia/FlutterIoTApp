import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/use_cases/configurar_alarma_usecase.dart';
import 'package:iot_isra_app/features/alarm/domain/use_cases/desactivar_alarma_usecase.dart';
import 'package:iot_isra_app/features/alarm/domain/use_cases/get_alarmas_usecase.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_alarm_providers.dart';
import 'package:iot_isra_app/utils/logger.dart';
import 'package:uuid/uuid.dart'; 
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository_impl.dart';
import 'package:iot_isra_app/features/alarm/data/alarm_remote_datasource.dart';


//Provider para desactivar o activar alarmas
final desactivarAlarmaUseCaseProvider = Provider(
  (ref) => DesactivarAlarmaUseCase(ref.watch(alarmRepositoryProvider)),
);



final showAlarmDialogProvider = StateProvider<bool>((ref) => false);

final alarmRemoteDatasourceProvider = Provider(
  (ref) => AlarmRemoteDatasource(ref.watch(dioProvider)),
);

final alarmRepositoryProvider = Provider<AlarmRepository>(
  (ref) => AlarmRepositoryImpl(ref.watch(alarmRemoteDatasourceProvider)),
);

final getAlarmasUseCaseProvider = Provider(
  (ref) => GetAlarmasUseCase(ref.watch(alarmRepositoryProvider)),
);

final alarmListProvider = StateNotifierProvider<AlarmListNotifier, List<AlarmModel>>(
  (ref) {
    final getUseCase = ref.watch(getAlarmasUseCaseProvider);
    final desactivarUseCase = ref.watch(desactivarAlarmaUseCaseProvider);
    final configurarUseCase = ref.watch(configurarAlarmaUseCaseProvider); // 👈 nuevo

    return AlarmListNotifier(
      getUseCase,
      desactivarUseCase,
      configurarUseCase, // 👈 pásalo
    );
  },
);





class AlarmListNotifier extends StateNotifier<List<AlarmModel>> {
  AlarmListNotifier(
    this._getAlarmasUseCase,
    this._desactivarAlarmaUseCase,
    this._configurarAlarmaUseCase, // 👈 nuevo
  ) : super([]) {
    cargarAlarmas();
  }

  final GetAlarmasUseCase _getAlarmasUseCase;
  final DesactivarAlarmaUseCase _desactivarAlarmaUseCase;
  final ConfigurarAlarmaUseCase _configurarAlarmaUseCase; // 👈 nuevo


  Future<void> cargarAlarmas() async {
    try {
      final alarmas = await _getAlarmasUseCase();
      alarmas.sort((a, b) => a.hora.compareTo(b.hora)); 
      state = alarmas;
    } catch (e) {
      logger.e("Error al cargar alarmas $e");
      }
  }
   


  Future<void> addAlarmFromServer(String formattedTime) async {
  try {
    final alarma = await _configurarAlarmaUseCase(formattedTime);
    final nuevaLista = [...state, alarma];
    nuevaLista.sort((a, b) => a.hora.compareTo(b.hora));
    state = nuevaLista;
  } catch (e) {
    logger.e("Error al crear alarma: $e");
  }
}



  Future<void> toggleAlarm(int index, bool value) async {
    final updated = state[index];

    try {
      final result = await _desactivarAlarmaUseCase(updated.id, updated.hora, value);
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            result
          else
            state[i],
      ];
    } catch (_) {
      logger.e(" 🚨 Error al cambiar estado de la alarma");
    }
  }
}


