import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import '../constants/secure_storage.dart';

class GDriveClient extends IOClient {
  late Map<String, String> _headers;

  GDriveClient() : super();

  final _account = GoogleSignIn.standard(scopes: [ga.DriveApi.driveScope]);

  Future<void> signIn() async {
    SecureStorage secureStorage = SecureStorage();
    Map<String, String>? secureCredentials =
        await secureStorage.getGDCredentials();
    if (!await _account.isSignedIn() &&
        (secureCredentials == null || secureCredentials.isEmpty)) {
      await _account.signIn();
      _headers = await _account.currentUser!.authHeaders;
      secureStorage.saveGDCredentials(_headers);
      for (String header in _headers.keys) {
        log(header);
      }
    } else {
      print(secureCredentials!);
      _headers = secureCredentials!;
    }
  }

  @override
  Future<IOStreamedResponse> send(BaseRequest request) {
    return super.send(request..headers.addAll(_headers));
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers!..addAll(_headers));

  Future<ga.FileList> getFiles() async {
    await signIn();
    return ga.DriveApi(this).files.list();
  }
}
