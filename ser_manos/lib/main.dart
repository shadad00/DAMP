import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/design_system/cells/forms/ContactDataForm.dart';
import 'package:ser_manos/design_system/cells/header.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Gender.dart';

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
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);

    return Scaffold(
        appBar: SermanosHeader.tabsHeader(controller: tabController), 
        body: const ContactDataForm());
  }
}

const image = 'http://pawserver.it.itba.edu.ar/paw-2023a-01/images/153';

const User user = User(
  id: '1234567890',
  name: 'John',
  surname: 'Doe',
  email: 'johndoe@gmail.com',
  phone: '1234567890',
  gender: Gender.male,
  profileImageUrl: null,
  emailContact: 'johndoe@gmail.com',
);
