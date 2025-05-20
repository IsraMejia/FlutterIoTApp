import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';

class DesactivarAlarmaUseCase {
  final AlarmRepository repository;
  DesactivarAlarmaUseCase(this.repository);

  Future<AlarmModel> call(int id, String hora, bool activa) {
    return repository.desactivarAlarma(id, hora, activa);
  }
}
