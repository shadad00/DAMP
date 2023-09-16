import 'package:flutter/material.dart';

class SermanosLogos extends StatelessWidget {
  const SermanosLogos(
      {super.key,
      required this.logoUrl,
      required this.width,
      required this.height});

  final String logoUrl;
  final double width;
  final double height;

  const SermanosLogos.square({Key? key, required String logoUrl})
      : this(key: key, logoUrl: logoUrl, width: 150, height: 150);

  const SermanosLogos.rectangular({Key? key, required String logoUrl})
      : this(key: key, logoUrl: logoUrl, width: 150, height: 25);

  @override
  Widget build(BuildContext context) {
    return Image.asset(logoUrl, width: width, height: height);
  }

}
