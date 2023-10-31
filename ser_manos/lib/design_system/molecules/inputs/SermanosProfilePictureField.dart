import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/cards/ProfilePictureCards/ExtendedUploadProfilePicture.dart';
import 'package:ser_manos/design_system/cells/cards/ProfilePictureCards/UploadProfilePicture.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SermanosProfilePictureField extends HookWidget {
  const SermanosProfilePictureField({
    super.key,
    required this.formName,
    required this.initialValue,
    this.enabled = true,
    this.validators,
    required this.userId,
  }) : image = initialValue;

  final String formName;
  final String? initialValue;
  final bool enabled;
  final String? image;
  final String userId;

  final List<String? Function(String?)>? validators;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> imageUrl = useState(image);

    return FormBuilderField<String>(
      name: formName,
      initialValue: initialValue,
      builder: (FormFieldState field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageUrl.value == null
                ? UploadProfilePictureCard(userId: userId, field: field)
                : ExtendedUploadProfilePicture(imageUrl: imageUrl.value!, field: field, userId: userId),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Text(
                  field.errorText!,
                  textAlign: TextAlign.start,
                  style: const SermanosTypography.body01(
                      color: SermanosColors.error100),
                ),
              )
          ],
        );
      },
    );

    // return ValidatedField(
    //   formName: formName,
    //   initialValue: initialValue,
    //   builder: (state) =>
    //       getBuilder(state, enabled, imageUrl.value, initialValue),
    //   validator: FormBuilderValidators.compose(validators ?? []),
    // );
  }

  // Widget getBuilder(FormFieldState field, bool enabled, String? imageUrl,
  //     String? initialValue) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //        imageUrl == null
  //               ?  UploadProfilePictureCard(userId: userId)
  //               : ExtendedUploadProfilePicture(imageUrl: imageUrl),
  //       if (field.errorText != null)
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
  //           child: Text(
  //             field.errorText!,
  //             textAlign: TextAlign.start,
  //             style: const SermanosTypography.body01(
  //                 color: SermanosColors.error100),
  //           ),
  //         )
  //     ],
  //   );
  // }
}
