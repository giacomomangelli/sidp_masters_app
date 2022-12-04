import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class GDriveClient extends IOClient{

  late Map<String, String> _headers;

  GDriveClient() : super();

  final _account = GoogleSignIn.standard(scopes: [ga.DriveApi.driveScope]);

  Future<void> signIn() async {
    if (!await _account.isSignedIn()) {
      await _account.signIn();
      _headers = await _account.currentUser!.authHeaders;
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