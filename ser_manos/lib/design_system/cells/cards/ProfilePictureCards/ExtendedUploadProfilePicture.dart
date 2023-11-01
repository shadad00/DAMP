import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/providers/Notifier/Profile/PathProvider.dart';

class ExtendedUploadProfilePicture extends ConsumerWidget {
  final String imageUrl;
  final FormFieldState field;
  final String userId;

  const ExtendedUploadProfilePicture(
      {super.key,
      required this.imageUrl,
      required this.field,
      required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: SermanosColors.secondary25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Foto de perfil",
                style: SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
              ShortButton(
                text: "Cambiar foto",
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
          ProfileImage(imageUrl: imageUrl)
        ],
      ),
    );
  }
}
