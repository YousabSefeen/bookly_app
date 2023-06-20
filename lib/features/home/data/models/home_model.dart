import 'package:bookly/features/home/data/models/volumeInfo_model.dart';
import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  final String id;
  final VolumeInfoModel volumeInfoModel;

  const HomeModel({
    required this.id,
    required this.volumeInfoModel,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      volumeInfoModel: json['volumeInfo'],
    );
  }

  @override
  List<Object> get props => [id, volumeInfoModel];
}
