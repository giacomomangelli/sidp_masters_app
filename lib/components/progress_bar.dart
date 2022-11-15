import 'package:flutter/material.dart';
import 'package:sidp_masters/constants/constants.dart';

class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({super.key});

  @override
  State<ProgressIndicator> createState() =>
      _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: Duration(seconds: ScreenDelays.screenDelay.value),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.width)/100 * 5,
      width: (MediaQuery.of(context).size.width)/100 * 99,
      child:
      // Padding(
        // padding: const EdgeInsets.all(20.0),
          LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
        )
        // Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: <Widget>[
            // const Text(
            //   'Linear progress indicator with a fixed color',
            //   style: TextStyle(fontSize: 20),
            // ),
            // LinearProgressIndicator(
            //   value: controller.value,
            //   semanticsLabel: 'Linear progress indicator',
            // ),
          // ],
        // ),
      // ),
    );
  }
}
