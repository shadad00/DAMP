import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class UploadProfilePictureCard extends StatelessWidget {
  const UploadProfilePictureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: SermanosColors.secondary25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            const Text(
                "Foto de perfil",
                style: SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
        ShortButton(
            text: "Subir foto",
            onPressed: () => {}
            )
      ],
      ),
    );
  }
}
