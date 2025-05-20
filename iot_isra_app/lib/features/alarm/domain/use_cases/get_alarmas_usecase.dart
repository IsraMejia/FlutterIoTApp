import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';

class GetAlarmasUseCase {
  final AlarmRepository repository;
  GetAlarmasUseCase(this.repository);

  Future<List<AlarmModel>> call() {
    return repository.getAlarmas();
  }
}
