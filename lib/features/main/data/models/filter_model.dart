import 'package:binance_api/features/main/domain/enities/filter_entity.dart';

class FilterModel extends FilterEntity{
  FilterModel({
    required String filterType,
    required String? minPrice,
    required String? maxPrice,
    required String? tickSize,

  }) : super(
    filterType: filterType,
    minPrice: minPrice,
    maxPrice: maxPrice,
    tickSize: tickSize,
  );

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      filterType: json['filterType'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      tickSize: json['tickSize'],
    );
  }
}