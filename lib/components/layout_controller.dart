import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutController {
  final List<Widget> pages;
  List<Widget> listeners;
  int currentPage;
  final int initialPage;

  LayoutController({required this.pages, this.initialPage = 0, this.currentPage = 0, this.listeners = const <Widget>[]}) : assert(pages.isNotEmpty);

  Widget getPage(int index){
    return pages.length <= index ? pages.last : pages[index];
  }

  double getCurrentPage(){
    return currentPage.toDouble();
  }

  double getInitialPage(){
    return initialPage.toDouble();
  }
  
  void addListeners(Widget widget){
    listeners.add(widget);
  }
}
