import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:project_awesome/bloc/image/all_image_bloc.dart';
import 'package:project_awesome/core/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_awesome/remote_data_source/image_remote_data_source.dart';
import 'package:project_awesome/repositories/image_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AllImageBloc(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data Source
  sl.registerLazySingleton<ImageRemoteDataSource>(
    () => ImageRemoteDataImpl(
      dio: sl(),
    ),
  );

  /// External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );
}
