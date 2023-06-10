import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/image_screen/image_picker.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/login_screen.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final colorScheme = ColorScheme;
  final textTheme = ColorScheme;
  int _currentIndex = 0;
  //int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1
          ? AppBar(
              backgroundColor: Colors.pink,
              automaticallyImplyLeading: false,
              title: const Text('ПРОФИЛЬ'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  icon: const Icon(Icons.logout),
                )
              ],
            )
          : AppBar(
              backgroundColor: Colors.pink,
              automaticallyImplyLeading: false,
              title: const Text('Image Searcher'),
              centerTitle: true,
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            label: 'ПОИСК',
            icon: Icon(Icons.local_fire_department),
          ),
          const BottomNavigationBarItem(
            label: 'ПРОФИЛЬ',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (_currentIndex == 0) {
      return const Center(
        child: ImagePickerPage(),
      );
    } else {
      return const ProfilePage();
    }
  }
}
