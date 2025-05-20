import '../models/iot_device_model.dart';

abstract class IotRepository {
  Future<IotDeviceModel> actualizarDispositivo(String nombre, bool estado);
  Future<List<IotDeviceModel>> getDispositivos();
}
