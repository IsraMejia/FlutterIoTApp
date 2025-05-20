import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/domain/models/sleep_result_model.dart';
import 'package:iot_isra_app/features/alarm/domain/use_cases/calcular_sueno_usecase.dart';
import 'set_new_alarm.dart';

final calcularSuenoUseCaseProvider = Provider(
  (ref) => CalcularSuenoUseCase(ref.watch(alarmRepositoryProvider)),
);

final sleepResultProvider = StateNotifierProvider<SleepResultNotifier, SleepResultModel?>(
  (ref) => SleepResultNotifier(ref.watch(calcularSuenoUseCaseProvider)),
);

class SleepResultNotifier extends StateNotifier<SleepResultModel?> {
  SleepResultNotifier(this._useCase) : super(null);
  final CalcularSuenoUseCase _useCase;

  Future<void> calcular(int id, String horaActual) async {
    final result = await _useCase(id, horaActual);
    state = result;
  }
}
