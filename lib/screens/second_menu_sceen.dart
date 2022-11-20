import 'package:flutter/material.dart';

class SecondMenuScreen extends StatelessWidget {
  const SecondMenuScreen({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Users',
          style: TextStyle(fontSize: 35)
        )
      )
    );
  }
}