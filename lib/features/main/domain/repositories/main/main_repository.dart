
// ignore: import_of_legacy_library_into_null_safe
import 'package:binance_api/core/error/failures.dart';
import 'package:binance_api/core/usecases/usecase.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepository {
  Future<Either<Failure, List<ExchangeEntity>>> getMainInfo(NoParams params);
}