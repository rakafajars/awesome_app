
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:project_awesome/core/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );
}