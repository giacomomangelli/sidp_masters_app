import 'package:flutter/material.dart';
import 'package:sidp_masters/components/layout_controller.dart';
import 'package:sidp_masters/components/layout_displayer.dart';
import 'package:sidp_masters/screens/first_menu_screen.dart';
import 'package:sidp_masters/screens/second_menu_sceen.dart';
import 'package:sidp_masters/screens/third_menu_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: LayoutDisplayer(
            controller: LayoutController(pages: const <Widget>[
          FirstMenuScreen(),
          SecondMenuScreen(),
          ThirdMenuScreen()
        ])));
  }
}
