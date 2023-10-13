import 'package:binance_api/core/services/network/endpoints.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:dio/dio.dart';
import 'package:binance_api/core/error/exceptions.dart';
import 'package:binance_api/core/services/network/endpoints.dart';
import 'package:binance_api/core/utils/helpers/dio_helper.dart';
import 'package:binance_api/features/main/data/models/exchange_model.dart';

abstract class MainRemoteDataSource {
  Future<List<ExchangeEntity>> getMainInfo();
}

class MainRemoteDataSourceImpl
    implements MainRemoteDataSource {
  final Dio dio;

  MainRemoteDataSourceImpl({required this.dio});
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };



  /// Get main info 
  @override
  Future<List<ExchangeEntity>> getMainInfo() async {
    Response response = await dio.get(Endpoints.getMainInfo.getPath(),
        options: Options(
          headers: headers,
          validateStatus: (status) => status! < 501,
        ));
    printRes(response);
    if (response.statusCode == 200) {
      return (response.data['symbols'] as List).map((json) => ExchangeModel.fromJson(json)).toList();
    } else if(response.statusCode == 400) {
      throw ServerException(message: response.data['detail']);
    }
    else {
      throw ServerException(message: 'Ошибка с сервером');
    }
  }

}
