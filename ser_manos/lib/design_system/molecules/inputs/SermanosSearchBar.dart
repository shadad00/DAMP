import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/shadows/shadows.dart';
import 'package:ser_manos/design_system/molecules/inputs/ValidatedField.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';





class SermanosSearchBar extends HookWidget {
  const SermanosSearchBar({
    super.key,
    required this.onChanged,
    required this.initialValue
  });

  final void Function(String) onChanged;
  final String initialValue; 
  static const String formName = "searchBar"; 

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final controller = useTextEditingController(text: '');

    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    return Container(
        decoration: BoxDecoration(
          color: SermanosColors.neutral0,
          borderRadius: BorderRadius.circular(2),
          boxShadow: SermanosShadows.shadow1,
        ),
        child: ValidatedField(
            formName: formName ,
            initialValue: initialValue,
            builder: (state) =>
                getBuilder(state, isEmpty, focusNode, controller),
            onReset: () => ''));
  }

    Widget getBuilder(
    FormFieldState field,
    bool isEmpty, 
    FocusNode focusNode,
    TextEditingController controller   
    ){
    return TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          hintText: 'Buscar',
          hintStyle: const SermanosTypography.subtitle01().copyWith(
            color: SermanosColors.neutral75,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          prefixIcon: SermanosIcons.search(
            status: SermanosIconStatus.enabledSecondary,
          ),
          suffixIcon: isEmpty
              ? null //todo: ver 
              : IconButton(
                  icon: SermanosIcons.close(
                    status: SermanosIconStatus.enabledSecondary,
                  ),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
        ),
        onTapOutside: (e) => focusNode.unfocus(),
        onEditingComplete: () => focusNode.unfocus(),
        onSubmitted: onChanged
      ); 

  }



}
