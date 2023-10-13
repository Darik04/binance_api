import 'package:binance_api/features/main/presentation/bloc/packages/main_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:binance_api/features/main/data/datasources/main/remote_datasource.dart';
import 'package:binance_api/features/main/data/repositories/main_repository_impl.dart';
import 'package:binance_api/features/main/domain/repositories/main/main_repository.dart';
import 'package:binance_api/features/main/domain/usecases/get_main_info.dart';
import 'constants/main_config_app.dart';
import 'core/services/network/config.dart';
import 'core/services/network/network_info.dart';


final sl = GetIt.instance;

void setupInjections() {

  //Main config of system
  sl.registerLazySingleton<MainConfigApp>(() => MainConfigApp());


  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerFactory<Dio>(
    () => Dio(BaseOptions(
      baseUrl: Config.url.url,
    )),
  );









  //Datasources
  sl.registerLazySingleton<MainRemoteDataSource>(
    () => MainRemoteDataSourceImpl(dio: sl()),
  );

  //Repositories
  sl.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(sl(), sl()),
  );

  //UseCases
  sl.registerLazySingleton(() => GetMainInfo(sl()));

  sl.registerFactory<MainBloc>(
    () => MainBloc(sl()),
  );
}
