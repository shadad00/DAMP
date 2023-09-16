import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/design_system/molecules/StatusBar.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SermanosHeader extends AppBar {
  SermanosHeader.tabsHeader({super.key})
      : super(
          title: const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: SermanosLogos.rectangular(
                  logoUrl: "assets/images/rectangularLogo.png")),
          systemOverlayStyle: const SermanosStatusBar.secondary(),
          backgroundColor: SermanosColors.secondary90,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Material(
              color: SermanosColors.secondary100,
              child: DefaultTabController(length: 52, child:  TabBar(
                unselectedLabelColor: SermanosColors.neutral25,
                labelColor: SermanosColors.neutral0,
                labelStyle: SermanosTypography.button(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: SermanosColors.secondary200,
                  border: Border(
                    bottom:
                        BorderSide(color: SermanosColors.neutral0, width: 3),
                  ),
                ),
                tabs: [
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
              )),
            ),
          ),
        );

  SermanosHeader.modalHeader({super.key})
      : super(
          systemOverlayStyle: const SermanosStatusBar.neutral0(),
          leading: const CloseButton(color: SermanosColors.neutral75),
        );

  SermanosHeader.sectionHeader({super.key, required String title})
      : super(
            systemOverlayStyle: const SermanosStatusBar.secondary(),
            backgroundColor: SermanosColors.secondary90,
            leading: const BackButton(color: SermanosColors.neutral0),
            centerTitle: true,
            title: Text(title,
                style: const SermanosTypography.subtitle01(
                    color: SermanosColors.neutral0)));
}
