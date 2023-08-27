import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Button_utils.dart';

import '../../tokens/colours/colours.dart';

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
        ? SerManosFilledButton(
            enabled: enabled,
            loading: loading,
            text: text,
            onPressed: onPressed,
            textColor: textColor,
            backgroundColor: SermanosColors.primary100,
            boxColor: SermanosColors.neutral0)
        : SerManosTextButton.notElevated(
            enabled: enabled,
            loading: loading,
            text: text,
            onPressed: onPressed,
            textColor: textColor,
            backgroundColor: Colors.transparent,
            boxColor: SermanosColors.neutral0);
  }
}
