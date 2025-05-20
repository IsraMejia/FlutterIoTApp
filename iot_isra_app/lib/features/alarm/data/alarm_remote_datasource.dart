import 'package:dio/dio.dart';
import 'package:iot_isra_app/features/alarm/domain/models/alarm_model.dart';
import 'package:iot_isra_app/features/alarm/domain/models/sleep_result_model.dart';

class AlarmRemoteDatasource {
  final Dio dio;
  AlarmRemoteDatasource(this.dio);

  Future<AlarmModel> configurarAlarma({required String hora}) async {
    final response = await dio.post(
      '/alarma/configurar',
      data: {"hora": hora, "activa": true},
    );
    return AlarmModel.fromJson(response.data);
  }

  Future<List<AlarmModel>> getAlarmas() async {
    final response = await dio.get('/alarma');
    final List data = response.data;
    return data.map((e) => AlarmModel.fromJson(e)).toList();
  }

  Future<AlarmModel> desactivarAlarma({
      required int id, 
      required String hora, 
      required bool activa
    }) async {
    final response = await dio.post(
      '/alarma/desactivar',
      data: {
        "id": id,
        "hora": hora, 
        "activa": activa,
      },
    );
    return AlarmModel.fromJson(response.data);
  }

  Future<SleepResultModel> calcularSueno({required int id, required String horaActual}) async {
  final response = await dio.post(
    '/alarma/calculoSueno',
    data: {
      "id": id,
      "hora_actual": horaActual,
    },
  );
  return SleepResultModel.fromJson(response.data);
}


}
