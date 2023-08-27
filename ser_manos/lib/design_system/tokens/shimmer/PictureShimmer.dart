import 'package:flutter/material.dart';
import '../colours/colours.dart';
import 'package:shimmer/shimmer.dart';

class PictureShimmer extends StatelessWidget {
  const PictureShimmer({
    Key? key,
    this.height,
    this.width,
    this.rounded = true,
  }) : super(key: key);

  final bool rounded;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: SermanosColors.neutral100,
      highlightColor: SermanosColors.neutral25,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: SermanosColors.neutral100.withOpacity(0.06),
          borderRadius: rounded
              ? const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
