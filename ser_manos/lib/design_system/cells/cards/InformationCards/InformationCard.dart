import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/cells/cards/InformationCards/InformationCardUtil.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class InformationCard extends StatelessWidget {
  const InformationCard(
      {super.key,
      required this.title,
      required this.firsTitle,
      required this.firstSubtitle,
      required this.secondTitle,
      required this.secondSubtitle});

  final String title;
  final String firsTitle;
  final String firstSubtitle;
  final String secondTitle;
  final String secondSubtitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4), topRight: Radius.circular(4)),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
                color: SermanosColors.secondary25,
                child: Text(
                  title,
                  style: const SermanosTypography.subtitle01(
                      color: Colors.black //check
                      ),
                )),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                InformationCardUtil(title: firsTitle, subtitle: firstSubtitle),
                InformationCardUtil(
                    title: secondTitle, subtitle: secondSubtitle)
              ],
            ),
          )
        ],
      ),
    );
  }
}
