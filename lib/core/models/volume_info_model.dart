import 'package:equatable/equatable.dart';

import 'image_links_model.dart';

class VolumeInfoModel extends Equatable {
  final String title;
  final List<String>? authors;

  final String? publisher;
  final String? publishedDate;
  final String? description;
  final String previewLink;
  final List<String>? categories;
  final dynamic averageRating;
  final dynamic ratingsCount;
  final ImageLinksModel? imageLinksModel;

  const VolumeInfoModel({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.previewLink,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.imageLinksModel,
  });

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) {
    return VolumeInfoModel(
      title: json['title'],
      authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      previewLink: json['previewLink'],
      categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'],
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
        previewLink,
        categories,
        averageRating,
        ratingsCount,
        imageLinksModel,
      ];
}
