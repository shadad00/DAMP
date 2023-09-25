import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Gender.dart';
import 'package:ser_manos/navigation/navigation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:ser_manos/services/newsService.dart';
import 'firebase_options.dart';
import 'model/News.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  List<News> list = await getNews();

  print(list); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BeamerProvider(
      routerDelegate: delegate,
      child: MaterialApp.router(
        title: 'ser manos',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: delegate,
      ),
    );
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
