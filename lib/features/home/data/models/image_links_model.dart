import 'package:equatable/equatable.dart';

class ImageLinksModel extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinksModel({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) {
    return ImageLinksModel(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  List<Object?> get props => [
        smallThumbnail,
        thumbnail,
      ];
}
