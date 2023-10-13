// ignore: import_of_legacy_library_into_null_safe
import 'package:binance_api/core/error/exceptions.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:binance_api/core/error/failures.dart';
import 'package:binance_api/core/services/network/network_info.dart';
import 'package:binance_api/core/usecases/usecase.dart';
import 'package:binance_api/features/main/data/datasources/main/remote_datasource.dart';
import 'package:binance_api/features/main/domain/repositories/main/main_repository.dart';


class MainRepositoryImpl implements MainRepository {
  final MainRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  MainRepositoryImpl(
      this.remoteDataSource, this.networkInfo);


  /// Получение информации с бэка
  /// главная
  @override
  Future<Either<Failure, List<ExchangeEntity>>> getMainInfo(NoParams params) async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSource.getMainInfo();
        return Right(res);
      } catch (e) {
        print(e);
        if(e is ServerException){
          return Left(ServerFailure(e.message!));
        }
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }


}

