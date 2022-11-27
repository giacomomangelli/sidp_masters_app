import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutController {
  final List<Widget> pages;
  final List<Widget> listeners;
  final int initialPage;
  int _currentPage = 0;
  PageController? _pageController;
  bool _init = false;

  LayoutController({required this.pages, this.initialPage = 0, this.listeners = const <Widget>[]}) : assert(pages.isNotEmpty);

  int _getExposedIndex(int index){
    if(index > 0) {
      return pages.length <= index ? pages.length - 1 : index;
    }
    return 0;
  }

  Widget getPage(int index){
    return pages[_getExposedIndex(index)];
  }

  List<Widget> _getPages(){
    return pages;
  }

  void _initController(){
    _pageController = PageController(initialPage: initialPage);
    _currentPage = initialPage;
    _init = true;
  }

  Widget initPageView(){
    return PageView(
      controller: getPageController(),
      children: _getPages()
    );
  }

  PageController getPageController(){
    if(!_init){
      _initController();
    }
    return _pageController!;
  }

  void jumpToPage(int index){
    _currentPage = _getExposedIndex(index);
    _pageController!.jumpToPage(_currentPage);
  }

  double getCurrentPage(){
    return _currentPage.toDouble();
  }

  double getInitialPage(){
    return initialPage.toDouble();
  }

}
