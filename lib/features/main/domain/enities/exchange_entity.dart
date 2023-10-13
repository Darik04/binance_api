import 'package:binance_api/features/main/domain/enities/filter_entity.dart';
import 'package:equatable/equatable.dart';

class ExchangeEntity extends Equatable {
  final String symbol;
  final String status;
  final String baseAsset;
  final String quoteAsset;
  final List<FilterEntity> filters;

  ExchangeEntity({
    required this.status,
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.filters,
  });


  @override
  List<Object> get props => [
  ];


  FilterEntity get priceFilter => filters.where((element) => element.filterType == 'PRICE_FILTER').first;
  String get getPrices => '${priceFilter.minPrice ?? ''} - ${priceFilter.maxPrice ?? ''}';
}
