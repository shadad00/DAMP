import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ser_manos/design_system/cells/modals/PermissionModal.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/atoms/icons/logo.dart';
import 'package:ser_manos/providers/Future/permission/permission.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todo: add the status bar.
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: SermanosColors.neutral0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(children: [
              SermanosLogos.square(logoUrl: "assets/images/SquareLogo.png"),
              SizedBox(
                height: 30,
              ),
              Text("¡Bienvenido!",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.headline01(
                      color: SermanosColors.neutral100)),
              SizedBox(
                height: 48,
              ),
              Text(
                  "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                  textAlign: TextAlign.center,
                  style: SermanosTypography.subtitle01(
                      color: SermanosColors.neutral100))
            ]),
            Column(
              children: [
                CtaButton(
                    text: "Comenzar",
                    onPressed: () async {
                      await _checkEventTrackerPermission(context, ref);
                      if (context.mounted) {
                        context.popToNamed("/volunteering");
                      }
                    },
                    filled: true),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Future<void> _checkEventTrackerPermission(
      BuildContext context, WidgetRef ref) async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      var permission = await ref.read(eventTrackerPermissionProvider.future);
      if (context.mounted) {
        if (permission.isDenied) {
          await _showEventPermissionDialog(context);
          permission = await Permission.appTrackingTransparency.request();
        }
        if (permission.isGranted) {
          ref.invalidate(eventTrackerPermissionProvider);
        }
      }
    }
  }

_showEventPermissionDialog(BuildContext context) async =>
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const PermissionModal(
        title: "Monitoreo de eventos",
        content:
            "Sermanos solicita permiso para monitorear tu actividad en la aplicación. Esto no será compartido con nadie.",
       ),
    );

}
