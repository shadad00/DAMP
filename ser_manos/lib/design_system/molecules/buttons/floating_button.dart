import 'package:flutter/material.dart';

import '../../tokens/colours/colours.dart';
import '../../tokens/shadows/shadows.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: SermanosShadows.shadow3,
      ),
      child: Material(
        color: SermanosColors.primary10,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          splashColor: SermanosColors.neutral75.withOpacity(0.1),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: icon,
          ),
        ),
      ),
    );
  }
}
