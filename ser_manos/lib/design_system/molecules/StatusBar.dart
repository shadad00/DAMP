import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:flutter/services.dart';

class SermanosStatusBar extends SystemUiOverlayStyle {
  const SermanosStatusBar.neutral0()
      : super(
          statusBarColor: SermanosColors.neutral0,
          statusBarIconBrightness: Brightness.light, // For Android (light)
          statusBarBrightness: Brightness.dark, // For iOS (light)
        );

  const SermanosStatusBar.neutral100()
      : super(
          statusBarColor: SermanosColors.neutral100,
          statusBarIconBrightness: Brightness.light, // For Android (light)
          statusBarBrightness: Brightness.dark, // For iOS (light)
        );

  const SermanosStatusBar.secondary()
      : super(
          statusBarColor: SermanosColors.secondary90,
          statusBarIconBrightness: Brightness.light, // For Android (light)
          statusBarBrightness: Brightness.dark, // For iOS (light)
        );
}
