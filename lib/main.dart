// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/firebase_options.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/home_page_bottom_navigation.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Montserrat',
      ),
      title: 'ImageSearcher',
      home: FirebaseAuth.instance.currentUser != null
          ? const MyHomePage()
          : const LoginPage(),
    );
  }
}
