import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/design_system/tokens/shimmer/PictureShimmer.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow2,
        ),
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PictureShimmer(
                    width: 118,
                    rounded: false,
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
