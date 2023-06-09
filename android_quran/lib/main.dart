import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login Page',),
    );
  }
}

