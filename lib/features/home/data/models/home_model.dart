import 'package:bookly/features/home/data/models/sale_info_model.dart';
import 'package:bookly/features/home/data/models/volumeInfo_model.dart';
import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String id;
  final VolumeInfoModel volumeInfoModel;
  final SaleInfoModel? saleInfoModel;

  const HomeModel({
    required this.id,
    required this.volumeInfoModel,
    required this.saleInfoModel,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      volumeInfoModel:
          VolumeInfoModel.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfoModel: json['saleInfo'] == null
          ? null
          : SaleInfoModel.fromJson(json['saleInfo'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [id, volumeInfoModel, saleInfoModel];
}
