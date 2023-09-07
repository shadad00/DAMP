import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class ValidatedField extends HookWidget {
  const ValidatedField(
      {super.key,
      required this.formName,
      required this.initialValue,
      this.autovalidateMode = AutovalidateMode.onUserInteraction, 
      required this.validator,
      required this.builder,
      required this.onReset});

  final String formName;
  final String? initialValue;
  final AutovalidateMode autovalidateMode; 
  final String? Function(String?) validator;
  final Widget Function(FormFieldState<String>) builder;
  final void Function() onReset;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
        name: formName,
        initialValue: initialValue,
        onReset: onReset,
        autovalidateMode: autovalidateMode,
        validator: validator,
        builder: builder);
  }


  

}
