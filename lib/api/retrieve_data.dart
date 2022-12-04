import 'dart:developer';

import 'package:googleapis/drive/v3.dart';

import 'google_drive_client.dart';

class DocumentRetriever {
  Future<FileList> getDocument(GDriveClient client) async {
    DriveApi driveApi = DriveApi(client);
    var documents = await driveApi.files.list(q: 'mimeType=\'pdf\'');
    log(documents.toString());
    return documents;
  }
}
