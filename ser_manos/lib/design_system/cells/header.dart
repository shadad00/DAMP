import 'dart:io';

import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/design_system/molecules/StatusBar.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SermanosHeader extends AppBar {
  final TabController? controller;

  SermanosHeader.tabsHeader({super.key, this.controller})
      : super(
          title: const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: SermanosLogos.rectangular(
                  logoUrl: "assets/images/rectangularLogo.png")),
          systemOverlayStyle: const SermanosStatusBar.secondary(),
          backgroundColor: SermanosColors.secondary90,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Material(
              color: SermanosColors.secondary100,
              child: TabBar(
                controller: controller!,
                unselectedLabelColor: SermanosColors.neutral25,
                labelColor: SermanosColors.neutral0,
                labelStyle: const SermanosTypography.button(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  color: SermanosColors.secondary200,
                  border: Border(
                    bottom:
                        BorderSide(color: SermanosColors.neutral0, width: 3),
                  ),
                ),
                tabs: const [
                  Tab(
                    height: 52,
                    text: "Postularse",
                  ),
                  Tab(
                    height: 52,
                    text: "Mi perfil",
                  ),
                  Tab(
                    height: 52,
                    text: "Novedades",
                  ),
                ],
              ),
            ),
          ),
        );

  SermanosHeader.modalHeader({super.key, this.controller})
      : super(
          systemOverlayStyle: const SermanosStatusBar.neutral0(),
          leading: const CloseButton(color: SermanosColors.neutral75),
        );

  SermanosHeader.sectionHeader(
      {super.key, required String title, this.controller})
      : super(
            systemOverlayStyle: const SermanosStatusBar.secondary(),
            backgroundColor: SermanosColors.secondary90,
            leading: const BackButton(color: SermanosColors.neutral0),
            centerTitle: true,
            title: Text(title,
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral0)));
}
