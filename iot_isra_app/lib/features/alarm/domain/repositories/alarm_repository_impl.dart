 
import 'package:iot_isra_app/features/alarm/data/alarm_remote_datasource.dart';
import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/models/sleep_result_model.dart';
import 'alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  final AlarmRemoteDatasource remoteDatasource;
  AlarmRepositoryImpl(this.remoteDatasource);

  @override
  Future<AlarmModel> configurarAlarma(String hora) {
    return remoteDatasource.configurarAlarma(hora: hora);
  }

  @override
  Future<List<AlarmModel>> getAlarmas() {
    return remoteDatasource.getAlarmas();
  }

  @override
  Future<AlarmModel> desactivarAlarma(int id, String hora, bool activa) {
    return remoteDatasource.desactivarAlarma(id: id, hora: hora, activa: activa);
  }

  @override
  Future<SleepResultModel> calcularSueno(int id, String horaActual) {
    return remoteDatasource.calcularSueno(id: id, horaActual: horaActual);
  }


}
