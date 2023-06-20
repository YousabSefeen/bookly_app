import 'package:bookly/features/home/data/models/sale_info_model.dart';
import 'package:equatable/equatable.dart';

import 'imageLinks_model.dart';

class VolumeInfoModel extends Equatable {
  final String title;
  final List<String> authors;

  final String publisher;
  final String publishedDate;
  final String description;
  final List<String> categories;
  final int averageRating;
  final ImageLinksModel? imageLinksModel;
  final SaleInfoModel? saleInfoModel;

  const VolumeInfoModel({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.categories,
    required this.averageRating,
    required this.imageLinksModel,
    required this.saleInfoModel,
  });

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) {
    return VolumeInfoModel(
      title: json['title'],
      authors: json['authors'],
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      categories: json['categories'],
      averageRating: json['averageRating'],
      imageLinksModel: json['imageLinks'] == null
          ? null
          : ImageLinksModel.fromJson(json['imageLinks']),
      saleInfoModel: json['saleInfo'] == null
          ? null
          : SaleInfoModel.fromJson(json['saleInfo']),
    );
  }

  @override
  List<Object?> get props => [
        title,
        authors,
        publisher,
        publishedDate,
        description,
        categories,
        averageRating,
        imageLinksModel,
        saleInfoModel,
      ];
}
