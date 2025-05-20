import '../../data/iot_remote_datasource.dart';
import '../models/iot_device_model.dart';
import 'iot_repository.dart';

class IotRepositoryImpl implements IotRepository {
  final IotRemoteDatasource remoteDatasource;
  IotRepositoryImpl(this.remoteDatasource);

  @override
  Future<IotDeviceModel> actualizarDispositivo(String nombre, bool estado) {
    return remoteDatasource.actualizarDispositivo(nombre: nombre, estado: estado);
  }

  @override
  Future<List<IotDeviceModel>> getDispositivos() {
    return remoteDatasource.getDispositivos();
  }



}
