import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/molecules/inputs/SermanosInputBorder.dart';
import 'package:ser_manos/design_system/molecules/inputs/ValidatedField.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';

class SermanosTextField extends HookWidget {
  const SermanosTextField({
    super.key,
    required this.formName,
    this.initialValue,
    this.enabled = true,
    this.password = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.placeholder,
    this.validators,
    required this.keyboardType,
  });

  final String formName;
  final String? initialValue;
  final bool enabled;
  final bool password;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final String? placeholder;
  final List<String? Function(String?)>? validators;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(text: initialValue);

    final bool isEmpty = useListenableSelector(controller, () => controller.text.isEmpty);

    final isObscured = useState(password);

    return ValidatedField(
        formName: formName,
        initialValue: initialValue,
        validator: (value) => validationLogic(value, focusNode),
        builder: (state) => getBuilder(state, isObscured, isEmpty, focusNode, controller),
        onReset: () => controller.text = initialValue ?? ''); 
  }


  String? validationLogic(String? value, FocusNode focusNode) {
    if (focusNode.hasFocus) {
          return null;
        }
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
  }

  Widget getBuilder(
    FormFieldState field,
    ValueNotifier<bool> isObscured,
    bool isEmpty, 
    FocusNode focusNode,
    TextEditingController controller   
    ){
    return TextField(
          cursorColor: SermanosColors.secondary200,
          obscureText: isObscured.value,
          enabled: enabled,
          onChanged: (value) => field.didChange(value),
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: placeholder,
            hintStyle: SermanosTypography.subtitle01(
              color:
                  enabled ? SermanosColors.neutral50 : SermanosColors.neutral25,
            ),
            labelText: label,
            labelStyle: SermanosTypography.subtitle01(
              color: enabled
                  ? focusNode.hasFocus
                      ? SermanosColors.secondary200
                      : SermanosColors.neutral75
                  : SermanosColors.neutral50,
            ),
            floatingLabelBehavior: floatingLabelBehavior,
            floatingLabelStyle: SermanosTypography.caption(
              color: enabled
                  ? focusNode.hasFocus
                      ? SermanosColors.secondary200
                      : SermanosColors.neutral75
                  : SermanosColors.neutral50,
            ),
            disabledBorder: SermanosInputBorder.disabled().inputBorder,
            focusedBorder: SermanosInputBorder.focused().inputBorder,
            enabledBorder: SermanosInputBorder.enabled().inputBorder,
            errorBorder: SermanosInputBorder.error().inputBorder,
            errorStyle: const SermanosTypography.body01(
              color: SermanosColors.error100,
            ),
            errorMaxLines: 3,
            errorText: field.errorText,
            suffixIcon: !enabled
                ? null
                : password
                    ? IconButton(
                        icon: SermanosIcons.showFilled(
                          status: SermanosIconStatus.enabledSecondary,
                          hide: isObscured.value,
                        ),
                        onPressed: () {
                          isObscured.value = !isObscured.value;
                        },
                      )
                    : field.hasError
                        ? IconButton(
                            icon: SermanosIcons.errorFilled(
                              status: SermanosIconStatus.error,
                            ),
                            onPressed: () {
                              if (!isEmpty) {
                                controller.clear();
                                field.reset();
                              }
                            },
                          )
                        : isEmpty
                            ? null
                            : IconButton(
                                icon: SermanosIcons.close(
                                  status: SermanosIconStatus.activated,
                                ),
                                onPressed: () {
                                  if (!isEmpty) {
                                    controller.clear();
                                    field.reset();
                                  }
                                },
                              ),
          ),
          onTapOutside: (e) => focusNode.unfocus(),
          onEditingComplete: () => focusNode.unfocus(),
          onSubmitted: (value) => focusNode.unfocus(),
        );

  }


}
