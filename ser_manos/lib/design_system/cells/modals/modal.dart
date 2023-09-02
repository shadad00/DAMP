import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';

class Modal extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final String confirmButtonText;
  final String cancelButtonText;
  final bool isLoading;
  final Future<void> Function() onConfirm;

  const Modal(
      {Key? key,
      required this.firstText,
      this.secondText,
      required this.confirmButtonText,
      required this.cancelButtonText,
      required this.isLoading,
      required this.onConfirm})
      : super(key: key);

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
                    firstText,
                    style: const SermanosTypography.subtitle01(),
                  ),
                  if (secondText != null)
                    Text(
                      secondText!,
                      style: const SermanosTypography.headline02(),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShortButton(
                    text: cancelButtonText,
                    onPressed: () => Navigator.of(context).pop(false),
                    textColor: SermanosColors.primary100,
                    enabled: !isLoading,
                    filled: false,
                  ),
                  ShortButton(
                    text: confirmButtonText,
                    onPressed: () async {
                      await onConfirm();
                    },
                    textColor: SermanosColors.primary100,
                    loading: isLoading,
                    filled: false,
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
