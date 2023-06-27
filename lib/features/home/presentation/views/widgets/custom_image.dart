import 'package:bookly/core/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.3 / 3.5,
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, _) => const Center(
            child: Text(
              'Loading...',
              style: AppStyles.textStyle16,
            ),
          ),
          errorWidget: (context, s, _) => const Icon(
            FontAwesomeIcons.circleExclamation,
            size: 25,
          ),
        ),
      ),
    );
  }
}
/*
     return Container(
                          padding: EdgeInsets.only(right: width * 0.03),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: width * 0.4,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl:
                                  ApiConstants.imageUrl(movie.backdropPath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: height * 0.2,
                                  width: width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
 */
