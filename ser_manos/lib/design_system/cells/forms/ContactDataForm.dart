import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import '../../molecules/inputs/SermanosTextField.dart';

class ContactDataForm extends StatelessWidget {
  const ContactDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    String? errorText;

    return FormBuilder(
      enabled: !isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de contacto",
            style: SermanosTypography.headline01(
              color: SermanosColors.neutral100,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
            style: SermanosTypography.subtitle01(
              color: SermanosColors.neutral100,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SermanosTextField(
              formName: 'Teléfono',
              initialValue: '',
              label: 'Teléfono',
              enabled: !isLoading,
              keyboardType: TextInputType.phone,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              placeholder: 'Ej: +541178445459',
              validators: null),
          const SizedBox(height: 24),
          SermanosTextField(
              formName: 'Mail',
              initialValue: '',
              label: 'Mail',
              password: true,
              enabled: !isLoading,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              placeholder: 'Ej: mimail@mail.com',
              validators: null),
        ],
      ),
    );
  }
}
