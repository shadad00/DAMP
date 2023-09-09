import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosTextField.dart';

class SermanosSignUpForm extends ConsumerWidget {
  const SermanosSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = false;
    String? errorText;

    return FormBuilder(
      enabled: !isLoading,
      child: Column(
        children: [
          SermanosTextField(
            formName: 'name',
            initialValue: '',
            enabled: !isLoading,
            validators: [
              FormBuilderValidators.required(errorText: "Ingrese su nombre"),
            ],
            label: 'Nombre',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Juan',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formName: 'surname',
            initialValue: '',
            enabled: !isLoading,
            validators: [
              FormBuilderValidators.required(errorText: "Ingrese su apellido"),
            ],
            label: 'Apellido',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: Barcena',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formName: 'email',
            initialValue: '',
            enabled: !isLoading,
            validators: [
              FormBuilderValidators.required(errorText: "Ingrese su email"),
            ],
            label: 'Email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: juanbarcena@gmail.com',
          ),
          const SizedBox(height: 24),
          SermanosTextField(
            formName: 'password',
            initialValue: '',
            enabled: !isLoading,
            validators: [
              FormBuilderValidators.required(
                  errorText: "Ingrese una contraseña"),
              FormBuilderValidators.minLength(
                8,
                errorText: "La contraseña debe tener al menos 8 caracteres",
              )
            ],
            label: 'Contraseña',
            password: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: ABCD1234',
          ),
          if (errorText != null)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  errorText,
                  style: const SermanosTypography.caption(
                    color: SermanosColors.error100,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}