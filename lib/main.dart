import 'package:flutter/material.dart';
import 'package:sidp_masters/screens/home_page_screen.dart';
import 'package:sidp_masters/screens/login_screen.dart';
import 'package:sidp_masters/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIDP',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomePage(title: 'SIDP Login'),
        '/home/firstScreen': (BuildContext context) => const HomePage(title: 'SIDP Login'),
        '/home/SecondScreen': (BuildContext context) => const HomePage(title: 'SIDP Login')
      },
    );
  }
}

