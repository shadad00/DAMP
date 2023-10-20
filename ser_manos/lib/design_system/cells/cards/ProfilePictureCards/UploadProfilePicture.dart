import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ser_manos/services/implementations/FirebaseStorageService.dart';
import 'package:ser_manos/services/interfaces/StorageService.dart';

class UploadProfilePictureCard extends StatelessWidget {
  const UploadProfilePictureCard({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final StorageService storageService = FirebaseStorageService();
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No se seleccionó ninguna imagen'),
                  ),
                );
                return;
              }
              final path = results.files.single.path!;
              final fileName = results.files.single.name;

              storageService.uploadFile(
                  path: path, fileName: fileName, userId: userId);
            },
          )
        ],
      ),
    );
  }
}
