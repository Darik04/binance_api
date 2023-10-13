import 'package:equatable/equatable.dart';

class FilterEntity extends Equatable {
  final String filterType;
  final String? minPrice;
  final String? maxPrice;
  final String? tickSize;

  FilterEntity({
    required this.filterType,
    required this.minPrice,
    required this.maxPrice,
    required this.tickSize,
  });


  @override
  List<Object> get props => [
  ];
}
