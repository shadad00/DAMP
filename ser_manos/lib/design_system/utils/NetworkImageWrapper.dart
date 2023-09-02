import 'package:flutter/material.dart';
import '../tokens/shimmer/PictureShimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWrapper extends StatelessWidget {
  const NetworkImageWrapper({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (BuildContext context, String url, dynamic error) {
        return Image.asset("assets/images/sermanos_image_not_found.png");
      },
      placeholder: (BuildContext context, String url) {
        return const PictureShimmer(rounded: false);
      },
    );
  }
}
