import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/cards/Gender.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';

class SermanosRadioGroup extends HookWidget {
  const SermanosRadioGroup({
    super.key,
    required this.formName,
    required this.initialValue,
    this.enabled = true,
    required this.values,
    required this.labels,
  });

  final List<Gender> values;
  final List<String> labels;
  final String formName;
  final Gender? initialValue;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final gender = useState(initialValue);

    return FormBuilderField<Gender>(
      name: formName,
      initialValue: initialValue,
      onChanged: (val) => gender.value = val,
      validator: (valueCandidate) {
        if (gender.value == null && valueCandidate == null) {
          return 'Debes seleccionar un género';
        }
        return null;
      },
      builder: (FormFieldState field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: values.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Radio(
                          value: values[index],
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (enabled) {
                              return SermanosColors.primary100;
                            }
                            return SermanosColors.neutral50;
                          }),
                          groupValue: gender.value,
                          onChanged: (Gender? value) {
                            gender.value = value;
                            field.didChange(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        labels[index],
                        style: const SermanosTypography.body01(),
                      )
                    ],
                  ),
                );
              },
            ),
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
  }
}



