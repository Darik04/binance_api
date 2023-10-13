// ignore: import_of_legacy_library_into_null_safe
import 'package:binance_api/core/error/failures.dart';
import 'package:binance_api/core/usecases/usecase.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:binance_api/features/main/domain/repositories/main/main_repository.dart';
import 'package:dartz/dartz.dart';

class GetMainInfo implements UseCase<List<ExchangeEntity>, NoParams> {
  final MainRepository repository;

  GetMainInfo(this.repository);

  @override
  Future<Either<Failure, List<ExchangeEntity>>> call(NoParams params) async {
    return await repository.getMainInfo(params);
  }
}
