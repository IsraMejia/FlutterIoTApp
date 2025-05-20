import '../models/iot_device_model.dart';
import '../repositories/iot_repository.dart';

class UpdateDeviceStatusUseCase {
  final IotRepository repository;
  UpdateDeviceStatusUseCase(this.repository);

  Future<IotDeviceModel> call(String nombre, bool estado) {
    return repository.actualizarDispositivo(nombre, estado);
  }
}
