import 'package:binance_api/features/main/data/models/filter_model.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';

class ExchangeModel extends ExchangeEntity{
  ExchangeModel({
    required String symbol,
    required String status,
    required String baseAsset,
    required String quoteAsset,
    required List<FilterModel> filters

  }) : super(
    status: status,
    symbol: symbol,
    baseAsset: baseAsset,
    quoteAsset: quoteAsset,
    filters: filters
  );

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      symbol: json['symbol'],
      baseAsset: json['baseAsset'],
      status: json['status'],
      quoteAsset: json['quoteAsset'],
      filters: json['filters'] == null
      ? []
      : (json['filters'] as List).map((json) => FilterModel.fromJson(json)).toList(),
    );
  }
}