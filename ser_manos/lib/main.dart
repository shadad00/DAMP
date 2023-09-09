import 'package:flutter/material.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';

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

  @override
  Widget build(BuildContext context) {
    const User user = User(
      id: '1234567890',
      name: 'John',
      surname: 'Doe',
      email: 'johndoe@gmail.com',
      phone: '1234567890',
      gender: Gender.male,
      profileImageUrl: 'https://example.com/image.jpg',
      emailContact: 'johndoe@gmail.com',
    );


    return const Material(
        child: ProfileDataForm(
      user: user,
      imageField: "hlola",
      genderField: "hola",
      birthdateField: "hola",
    ));
  }
}
