import 'package:iot_isra_app/features/alarm/domain/models/sleep_result_model.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';

class CalcularSuenoUseCase {
  final AlarmRepository repository;
  CalcularSuenoUseCase(this.repository);

  Future<SleepResultModel> call(int id, String horaActual) {
    return repository.calcularSueno(id, horaActual);
  }
}

