import 'package:flutter/material.dart';

import 'package:ser_manos/design_system/molecules/inputs/SermanosTextField.dart';
import 'package:ser_manos/design_system/molecules/inputs/ValidatedField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ser Manos'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  String? hola(String? param) {
    print("validando"); 
    return "error";
  }

  @override
  Widget build(BuildContext context) {
    final List<String? Function(String?)> list = List.unmodifiable([hola]);

    return Material(
      child: SizedBox(
          width: 100,
          height: 100,
          child: SermanosTextField(
              formName: "formName",
              initialValue: "initialValue",
              password: true,
              label: "label",
              placeholder: "placeholder",
              validators: list)),
    );
  }
}
