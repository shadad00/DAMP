import 'package:flutter/material.dart';
import '/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/molecules/buttons/Button_utils.dart';

class ShortButton extends StatelessWidget {
  const ShortButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onPressed,
    this.filled = true,
    this.textColor = SermanosColors.neutral0,
    this.enabled = true,
    this.loading = false,
  }) : super(key: key);

  final Icon? icon;
  final String text;
  final VoidCallback onPressed;
  final bool filled;
  final bool enabled;
  final bool loading;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon != null
            ? TextButton.icon(
                onPressed: loading | !enabled ? null : onPressed,
                icon: icon!,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SermanosColors.primary100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(
                    12.0,
                  ),
                ),
                label: Center(
                    child: LoadingFrame(
                        loading: loading,
                        boxColor: textColor,
                        text: text,
                        textColor: textColor)),
              )
            : filled
                ? SerManosFilledButton(
                    enabled: enabled,
                    loading: loading,
                    text: text,
                    onPressed: onPressed,
                    textColor: textColor,
                    backgroundColor: SermanosColors.primary100,
                    boxColor: textColor)
                : SerManosTextButton.elevated(
                    enabled: enabled,
                    loading: loading,
                    text: text,
                    onPressed: onPressed,
                    textColor: textColor)
      ],
    );
  }
}
