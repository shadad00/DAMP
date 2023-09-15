import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SerManosFilledButton extends StatelessWidget {
  const SerManosFilledButton(
      {Key? key,
      required this.enabled,
      required this.loading,
      required this.text,
      required this.onPressed,
      required this.textColor,
      required this.backgroundColor,
      required this.boxColor})
      : super(key: key);

  final bool enabled;
  final bool loading;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        // minimumSize: const Size.fromHeight(40),
        backgroundColor: backgroundColor,
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
              boxColor: boxColor,
              text: text,
              textColor: textColor)
            ),
    );
  }
}

class LoadingFrame extends StatelessWidget {
  const LoadingFrame({
    Key? key,
    required this.loading,
    required this.boxColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final bool loading;
  final Color boxColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return loading
        ? SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: boxColor,
            ),
          )
        : Text(
            text,
            style: SermanosTypography.button(
              color: textColor,
            ),
          );
  }
}

class SerManosTextButton extends StatelessWidget {
  const SerManosTextButton(
      {Key? key,
      required this.enabled,
      required this.loading,
      required this.text,
      required this.onPressed,
      required this.textColor,
      this.backgroundColor,
      this.boxColor,
      required this.buttonStyle})
      : super(key: key);

  final bool enabled;
  final bool loading;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color? backgroundColor;
  final Color? boxColor;
  final ButtonStyle buttonStyle;

  SerManosTextButton.elevated(
      {Key? key,
      required enabled,
      required loading,
      required text,
      required onPressed,
      required textColor})
      : this(
            key: key,
            enabled: enabled,
            loading: loading,
            text: text,
            onPressed: onPressed,
            textColor: textColor,
            buttonStyle: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // <-- Radius
              ),
              padding: const EdgeInsets.all(
                12.0,
              ),
            ));

  SerManosTextButton.notElevated(
      {Key? key,
      required enabled,
      required loading,
      required text,
      required onPressed,
      required textColor,
      required backgroundColor,
      required boxColor})
      : this(
            key: key,
            enabled: enabled,
            loading: loading,
            text: text,
            onPressed: onPressed,
            textColor: textColor,
            backgroundColor: backgroundColor,
            boxColor: boxColor,
            buttonStyle: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: loading | !enabled ? null : onPressed,
      style: buttonStyle,
      child: Center(
          child: LoadingFrame(
              loading: loading,
              boxColor: boxColor!,
              text: text,
              textColor: textColor)),
    );
  }
}
