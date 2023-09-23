import 'dart:io';

import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/design_system/molecules/StatusBar.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SermanosHeader extends AppBar {

  SermanosHeader.modalHeader({super.key})
      : super(
          systemOverlayStyle: const SermanosStatusBar.neutral0(),
          leading: const CloseButton(color: SermanosColors.neutral75),
        );

  SermanosHeader.sectionHeader(
      {super.key, required String title})
      : super(
            systemOverlayStyle: const SermanosStatusBar.secondary(),
            backgroundColor: SermanosColors.secondary90,
            leading: const BackButton(color: SermanosColors.neutral0),
            centerTitle: true,
            title: Text(title,
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral0)));
}
