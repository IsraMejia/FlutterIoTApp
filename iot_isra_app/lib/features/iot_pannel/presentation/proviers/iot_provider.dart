import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_alarm_providers.dart';
import 'package:iot_isra_app/features/iot_pannel/data/iot_remote_datasource.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/repositories/iot_repository.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/repositories/iot_repository_impl.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/use_cases/update_device_status_usecase.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/use_cases/get_dispositivos_usecase.dart';
import 'package:iot_isra_app/features/iot_pannel/domain/models/iot_device_model.dart';

final iotRemoteDatasourceProvider = Provider(
  (ref) => IotRemoteDatasource(ref.watch(dioProvider)),
);

final iotRepositoryProvider = Provider<IotRepository>(
  (ref) => IotRepositoryImpl(ref.watch(iotRemoteDatasourceProvider)),
);

final updateDeviceStatusUseCaseProvider = Provider(
  (ref) => UpdateDeviceStatusUseCase(ref.watch(iotRepositoryProvider)),
);

final getDispositivosUseCaseProvider = Provider(
  (ref) => GetDispositivosUseCase(ref.watch(iotRepositoryProvider)),
);

final dispositivoEstadoProvider = FutureProvider.family<bool, String>((ref, nombreDispositivo) async {
  final useCase = ref.watch(getDispositivosUseCaseProvider);
  final dispositivos = await useCase();

  final match = dispositivos.firstWhere(
    (d) => d.nombre == nombreDispositivo,
    orElse: () => IotDeviceModel(
      id: 0,
      nombre: nombreDispositivo,
      estado: false,
      tipo: 'output',
    ),
  );

  return match.estado;
});
