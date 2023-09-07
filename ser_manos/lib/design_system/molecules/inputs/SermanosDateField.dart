import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/molecules/inputs/ValidatedField.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';


class SermanosDateField extends HookWidget {
  const SermanosDateField({
    Key? key,
    required this.formName,
    required this.initialDate,
    this.enabled = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.placeholder,
    this.validators,
    required this.minDate,
    required this.maxDate,
    required this.actualDate,
  }) : super(key: key);

  final String formName;
  final DateTime? initialDate;
  final DateTime minDate;
  final DateTime actualDate;
  final DateTime maxDate;

  final bool enabled;

  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final String? placeholder;
  final List<String? Function(String?)>? validators;

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    final String initialValue =
        initialDate == null ? '' : dateFormat.format(initialDate!);

    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(
      text: initialValue,
    );

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    return ValidatedField(
        formName: formName,
        initialValue: initialValue,
        validator: (value) => validationLogic(value, focusNode),
        builder: (state) => getBuilder(state,isEmpty, focusNode, controller, context, dateFormat),
        onReset: () => controller.text = initialValue
    ); 
  }


    

   Widget getBuilder(
    FormFieldState field,
    bool isEmpty, 
    FocusNode focusNode,
    TextEditingController controller,
    BuildContext context, 
    DateFormat dateFormat
    ){
      return TextField(
          keyboardType: TextInputType.datetime,
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          enabled: enabled,
          onChanged: (value) {
            field.didChange(value);
          },
          focusNode: focusNode,
          controller: controller,
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
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: SermanosColors.neutral50,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: SermanosColors.secondary200,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: SermanosColors.neutral75,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: SermanosColors.error100,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorStyle: const SermanosTypography.body01(
              color: SermanosColors.error100,
            ),
            errorMaxLines: 3,
            errorText: field.errorText,
            suffixIcon: !enabled
                ? null
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
                    : IconButton(
                        disabledColor: SermanosColors.neutral25,
                        icon: SermanosIcons.calendarFilled(
                          status: enabled
                              ? SermanosIconStatus.activated
                              : SermanosIconStatus.disabled,
                        ),
                        onPressed: !enabled
                            ? null
                            : () async {
                                DateTime? datetime = await showDatePicker(
                                    context: context,
                                    initialDate: initialDate ?? actualDate,
                                    firstDate: minDate,
                                    lastDate: maxDate,
                                    fieldLabelText: "Seleccionar fecha",
                                    helpText: "Seleccionar fecha",
                                    cancelText: "Cancelar".toUpperCase(),
                                    confirmText: "Ok".toUpperCase(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: SermanosColors.primary100,
                                            onPrimary: SermanosColors.neutral0,
                                            onSurface:
                                                SermanosColors.primary100,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const SermanosTypography
                                                          .button(
                                                      color: SermanosColors
                                                          .primary100),
                                              // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    });
                                if (datetime != null) {
                                  String date = dateFormat.format(datetime);
                                  field.didChange(date);
                                  controller.text = date;
                                }
                              },
                      ),
          ),
          onTapOutside: (e) {
            focusNode.unfocus();
          },
          onEditingComplete: () {
            focusNode.unfocus();
          },
          onSubmitted: (value) {
            focusNode.unfocus();
          },
        );
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

}
