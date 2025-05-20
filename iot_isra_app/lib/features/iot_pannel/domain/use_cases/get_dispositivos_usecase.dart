import '../models/iot_device_model.dart';
import '../repositories/iot_repository.dart';

class GetDispositivosUseCase {
  final IotRepository repository;
  GetDispositivosUseCase(this.repository);

  Future<List<IotDeviceModel>> call() {
    return repository.getDispositivos();
  }
}