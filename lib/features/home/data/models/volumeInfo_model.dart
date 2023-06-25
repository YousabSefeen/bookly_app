import 'package:equatable/equatable.dart';

import 'imageLinks_model.dart';

class VolumeInfoModel extends Equatable {
  final String title;
  final List<dynamic> authors;

  final String publisher;
  final String publishedDate;
  final String description;
  final List<dynamic> categories;
  final int? averageRating;
  final ImageLinksModel? imageLinksModel;

  const VolumeInfoModel({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.categories,
    required this.averageRating,
    required this.imageLinksModel,
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
          : ImageLinksModel.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
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
      ];
}
