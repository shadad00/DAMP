import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ser_manos/providers/Notifier/Profile/PathProvider.dart';

class UploadProfilePictureCard extends ConsumerWidget {
  const UploadProfilePictureCard(
      {super.key, required this.userId, required this.field});

  final String userId;
  final FormFieldState field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () async {
              final results = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: false,
                allowedExtensions: ['jpg', 'png'],
              );
              if (results == null) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No se seleccionó ninguna imagen'),
                    ),
                  );
                }
                return;
              }
              ref.read(pathProvider.notifier).update(results.files.single.path!); 
              field.didChange(results.files.single.path!);
            },
          )
        ],
      ),
    );
  }
}
