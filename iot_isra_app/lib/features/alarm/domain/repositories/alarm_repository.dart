

import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/models/sleep_result_model.dart';

abstract class AlarmRepository {

  Future<AlarmModel> configurarAlarma(String hora);

  Future<List<AlarmModel>> getAlarmas();

  Future<AlarmModel> desactivarAlarma(int id, String hora, bool activa);

  Future<SleepResultModel> calcularSueno(int id, String horaActual);


}
