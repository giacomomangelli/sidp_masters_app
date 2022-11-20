import 'package:flutter/material.dart';

import '../components/subject_card.dart';

class FirstMenuScreen extends StatelessWidget {
  const FirstMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const <Widget>[
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
        ]);
  }
}
