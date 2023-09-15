import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import '../../utils/NetworkImageWrapper.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.imageUrl,
    this.height = 110,
    this.width = 110,
    this.fromNetwork = true,
  }) : super(key: key);

  final String? imageUrl;
  final double height;
  final double width;
  final bool fromNetwork;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipOval(
            child: SizedBox(
              width: width,
              height: height,
              child: fromNetwork
                  ? NetworkImageWrapper(imageUrl: imageUrl!) //already checked.
                  : Image.file(
                      File(
                        imageUrl!,
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                            "assets/images/notFound.png");
                      },
                    ),
            ),
          )
        : SizedBox(
            child: SermanosIcons.account(
              status: SermanosIconStatus.activatedTerciary,
            ),
          );
  }
}
