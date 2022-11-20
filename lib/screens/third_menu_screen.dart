import 'package:flutter/material.dart';

class ThirdMenuScreen extends StatelessWidget {
  const ThirdMenuScreen({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Text(
                'Files',
                style: TextStyle(fontSize: 35)
            )
        )
    );
  }
}