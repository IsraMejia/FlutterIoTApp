import 'package:dio/dio.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/models/iot_device_model.dart';

class IotRemoteDatasource {
  final Dio dio;
  IotRemoteDatasource(this.dio);

  Future<IotDeviceModel> actualizarDispositivo({
    required String nombre,
    required bool estado,
  }) async {
    final response = await dio.post(
      '/iot/dispositivo',
      data: {
        "nombre": nombre,
        "estado": estado,
      },
    );
    return IotDeviceModel.fromJson(response.data);
  }

  Future<List<IotDeviceModel>> getDispositivos() async {
    final response = await dio.get('/iot/dispositivos');
    final List data = response.data;
    return data.map((e) => IotDeviceModel.fromJson(e)).toList();
  }

}

