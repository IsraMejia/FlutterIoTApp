import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/data/alarm_remote_datasource.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository.dart';
import 'package:iot_isra_app/features/alarm/domain/repositories/alarm_repository_impl.dart';
import 'package:iot_isra_app/features/alarm/domain/use_cases/configurar_alarma_usecase.dart';

final dioProvider = Provider((ref) {
  return Dio( 
    BaseOptions(baseUrl: 'http://192.168.0.131:8000')    
    );
});

final alarmRemoteDatasourceProvider = Provider((ref) {
  return AlarmRemoteDatasource(ref.watch(dioProvider));
});

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) {
  return AlarmRepositoryImpl(ref.watch(alarmRemoteDatasourceProvider));
});

final configurarAlarmaUseCaseProvider = Provider((ref) {
  return ConfigurarAlarmaUseCase(ref.watch(alarmRepositoryProvider));
});

 