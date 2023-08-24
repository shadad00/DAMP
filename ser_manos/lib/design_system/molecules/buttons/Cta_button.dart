import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Loading_frame.dart';

import '../../tokens/colours/colours.dart';
import '../../tokens/font/font.dart';

class CtaButton extends StatelessWidget {
  const CtaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.filled,
    this.textColor = SermanosColors.neutral0,
    this.enabled = true,
    this.loading = false,
  }) : super(key: key);

  final bool filled;
  final bool enabled;
  final bool loading;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return filled
        ? FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: SermanosColors.primary100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
            ),
            onPressed: loading | !enabled ? null : onPressed,
            child: Center(
                child: LoadingFrame(
                    loading: loading,
                    boxColor: SermanosColors.neutral0,
                    text: text,
                    textColor: textColor)),
          )
        : TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ),
            onPressed: loading | !enabled ? null : onPressed,
            child: Center(
                child: LoadingFrame(
                    loading: loading,
                    boxColor: SermanosColors.neutral0,
                    text: text,
                    textColor: textColor)),
          );
  }
}
