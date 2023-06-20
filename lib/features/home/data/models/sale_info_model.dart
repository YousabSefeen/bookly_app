import 'package:equatable/equatable.dart';

class SaleInfoModel extends Equatable {
  final String country;
  final String saleability;

  const SaleInfoModel({
    required this.country,
    required this.saleability,
  });

  factory SaleInfoModel.fromJson(Map<String, dynamic> json) {
    return SaleInfoModel(
      country: json['country'],
      saleability: json['saleability'],
    );
  }

  @override
  List<Object> get props => [country, saleability];
}
