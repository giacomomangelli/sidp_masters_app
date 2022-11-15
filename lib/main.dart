import 'package:flutter/material.dart';
import 'package:sidp_masters/screens/home_page_screen.dart';
import 'package:sidp_masters/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        '/home': (BuildContext context) => const HomePage(title: 'SIDP Login'),
        '/home/firstScreen': (BuildContext context) => const HomePage(title: 'SIDP Login'),
        '/home/SecondScreen': (BuildContext context) => const HomePage(title: 'SIDP Login')
      },
    );
  }
}

