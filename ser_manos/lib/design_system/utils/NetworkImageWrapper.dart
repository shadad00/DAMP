import 'package:flutter/material.dart';
import '../tokens/shimmer/PictureShimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWrapper extends StatelessWidget {
  const NetworkImageWrapper({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (BuildContext context, String url, dynamic error) {
        return Image.asset("assets/images/notFound.png");
      },
      placeholder: (BuildContext context, String url) {
        return const PictureShimmer(rounded: false);
      },
    );
  }
}
