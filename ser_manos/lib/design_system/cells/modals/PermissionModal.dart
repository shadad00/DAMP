import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';

class PermissionModal extends StatelessWidget {
  const PermissionModal({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;


  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          decoration: BoxDecoration(
            color: SermanosColors.neutral0,
            borderRadius: BorderRadius.circular(4),
            boxShadow: SermanosShadows.shadow3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const SermanosTypography.headline01(),
                  ),
                  Text(
                    content,
                    style: const SermanosTypography.subtitle01(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShortButton(
                    filled: false,
                    onPressed: () => Navigator.of(context).pop(),
                    textColor: SermanosColors.primary100,
                    text: "OK",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
