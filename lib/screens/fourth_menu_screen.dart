import 'package:flutter/material.dart';

class FourthMenuScreen extends StatelessWidget {
  const FourthMenuScreen({Key ? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Text(
                'Download',
                style: TextStyle(fontSize: 35)
            )
        )
    );
  }
}