import 'package:flutter/material.dart';
import 'package:sidp_masters/api/google_drive_client.dart';

import '../components/subject_card.dart';

class FirstMenuScreen extends StatelessWidget {
  const FirstMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GDriveClient gDriveClient = GDriveClient();
    gDriveClient.getFiles().then((fileList) => print(fileList.toString()));
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
