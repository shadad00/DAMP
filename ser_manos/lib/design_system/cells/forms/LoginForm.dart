import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import '../../molecules/inputs/SermanosTextField.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    String? errorText; 

    return FormBuilder(
      enabled: !isLoading,
      child: Column(
        children: [
          SermanosTextField(
              formName: 'email',
              initialValue: '',
              label: 'Email',
              enabled: !isLoading,
              validators: [
                FormBuilderValidators.required(errorText: "Ingrese su email"),
                FormBuilderValidators.email(
                    errorText: "Ingrese un mail válido"),
              ]),
          const SizedBox(height: 24),
          SermanosTextField(
              formName: 'password',
              initialValue: '',
              label: 'Contraseña',
              password: true,
              enabled: !isLoading,
              validators: [
                FormBuilderValidators.required(
                    errorText: "Ingrese su contraseña")
              ]),
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
