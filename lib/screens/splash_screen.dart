import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidp_masters/components/progress_bar.dart' as progress;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashDelay();
  }

  void splashDelay() async {
    bool skipLogin = false;
    final prefs = await SharedPreferences.getInstance();
    // final bool? saveUser = prefs.getBool('saveUser');
    // if (saveUser != null) {
    //   skipLogin = saveUser;
    // }
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.pushNamed(context, '/home');

    // if (skipLogin) {
    //   Navigator.pushNamed(context, '/home');
    // } else {
    //   Navigator.pushNamed(context, '/home',);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
        child: Row(
            //ROW 1
            children: [
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('images/sidp_logo_splash.png'),
                            fit: BoxFit.cover),
                      ),
                      constraints: const BoxConstraints.expand()))
            ]),
      ),
      Expanded(child: Row(
          //ROW 2
          children: const [Expanded(child: progress.ProgressIndicator())]))
    ]));
  }
}
