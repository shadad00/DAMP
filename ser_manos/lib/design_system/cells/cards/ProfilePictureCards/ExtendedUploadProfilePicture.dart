import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/services/implementations/FirebaseStorageService.dart';
import 'package:ser_manos/services/interfaces/StorageService.dart';

class ExtendedUploadProfilePicture extends StatelessWidget {
  final String imageUrl;
  final FormFieldState field;
  final String userId;

  const ExtendedUploadProfilePicture(
      {super.key,
      required this.imageUrl,
      required this.field,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    final StorageService storageService = FirebaseStorageService();

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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No se seleccionó ninguna imagen'),
                      ),
                    );
                    return;
                  }
                  final path = results.files.single.path!;
                  final fileName = results.files.single.name;

                  final newImageUrl = await storageService.uploadFile(
                      path: path, fileName: fileName, userId: userId);
                  field.didChange(newImageUrl);
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
