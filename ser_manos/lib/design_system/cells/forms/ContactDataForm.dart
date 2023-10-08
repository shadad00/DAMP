import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/model/User.dart';
import '../../molecules/inputs/SermanosTextField.dart';

class ContactDataForm extends StatelessWidget {
  final ApplicationUser? user; 

  const ContactDataForm({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Column(
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
            formName: 'phone',
            initialValue: user== null ? '' : user!.phone,
            label: 'Teléfono',
            enabled: !isLoading,
            keyboardType: TextInputType.phone,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: +541178445459',
            validators: [
              FormBuilderValidators.required(errorText: "Ingrese su teléfono"),
              FormBuilderValidators.match(
                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[0-9]*$',
                errorText: "Ingrese un teléfono válido",
              ),
            ]),
        const SizedBox(height: 24),
        SermanosTextField(
            formName: 'email',
            initialValue: user == null ? '' : user!.emailContact,
            label: 'Mail',
            password: false,
            enabled: !isLoading,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            placeholder: 'Ej: mimail@mail.com',
            keyboardType: TextInputType.emailAddress,
            validators: [
              FormBuilderValidators.required(errorText: "Ingrese su mail"),
              FormBuilderValidators.email(errorText: "Ingrese un mail válido")
            ]),
      ],
    );
  }
}
