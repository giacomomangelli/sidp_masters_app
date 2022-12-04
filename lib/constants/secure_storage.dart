import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

class SecureStorage {
  static const String authenticationHeader = "Authorization";
  static const String xGoogAuthUserHeader = "X-Goog-AuthUser";

  final storage = const FlutterSecureStorage();

  Future saveCredentials(AccessToken token, String refreshToken) async {
    await storage.write(key: "type", value: token.type);
    await storage.write(key: "data", value: token.data);
    await storage.write(key: "expiry", value: token.expiry.toString());
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  void saveGDCredentials(Map<String, String> headers) {
    storage.write(
        key: authenticationHeader, value: headers[authenticationHeader]);
    storage.write(
        key: xGoogAuthUserHeader, value: headers[xGoogAuthUserHeader]);
  }

  Future<DateTime> getCurrentTokenExpiryDateTime(AccessToken token) async {
    return token.expiry;
  }

  Future<Map<String, String>?> getGDCredentials() async {
    String? authHeader = await storage.read(key: authenticationHeader);
    String? xGoogHeader = await storage.read(key: xGoogAuthUserHeader);
    Map<String, String> result = {};
    result[authenticationHeader] = authHeader!;
    result[xGoogAuthUserHeader] = xGoogHeader!;

    if (result.isEmpty) {
      return null;
    }
    return result;
  }

  Future<Map<String, dynamic>?> getCredentials() async {
    var result = await storage.readAll();
    if (result.isEmpty) {
      return null;
    }
    return result;
  }

  Future clear() {
    return storage.deleteAll();
  }
}
