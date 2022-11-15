import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutDisplayer extends StatefulWidget {
  const LayoutDisplayer({
    Key? key,
    this.containerChild
  }) : super(key: key);

  final Widget? containerChild;

  @override
  State<LayoutDisplayer> createState() => _LayoutDisplayerState();
}

class _LayoutDisplayerState extends State<LayoutDisplayer> {

  Widget _container = Container();

  @override
  void initState() {
    _container = Container(
        child: widget.containerChild
    );
    super.initState();
  }

  void setLayout(Widget container){
    setState(() {
      _container = container;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _container;
  }
}
