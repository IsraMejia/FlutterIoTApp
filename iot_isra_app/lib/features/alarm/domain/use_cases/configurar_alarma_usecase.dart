 

import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';

class ConfigurarAlarmaUseCase {
  final AlarmRepository repository;
  ConfigurarAlarmaUseCase(this.repository);

  Future<AlarmModel> call(String hora) {
    return repository.configurarAlarma(hora);
  }
  
}