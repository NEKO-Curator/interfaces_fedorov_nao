import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/main_side_menu.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'ImageSearcher',
      home: const MainSideMenuWidget(),
    );
  }
}
