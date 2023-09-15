import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/design_system/cells/forms/ProfileDataForm.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';

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
    const image = 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153'; 

    const User user = User(
      id: '1234567890',
      name: 'John',
      surname: 'Doe',
      email: 'johndoe@gmail.com',
      phone: '1234567890',
      gender: Gender.male,
      profileImageUrl:
          null,
      emailContact: 'johndoe@gmail.com',
    );

    return Scaffold(
        appBar: AppBar(title: const Text('Ser manos')),
        body: const ProfileDataForm(
            user: user,
            genderField: "genderField",
            birthdateField: "birthdateField",
            imageField: "imageField"));
  }
}
