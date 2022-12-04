import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart' as sign_in;
import 'package:googleapis/drive/v3.dart';
import 'package:sidp_masters/constants/secure_storage.dart';
import 'package:sidp_masters/screens/home_page_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _connectGoogle() async {
    final googleSignIn =
        sign_in.GoogleSignIn.standard(scopes: [DriveApi.driveScope]);
    final sign_in.GoogleSignInAccount? account = await googleSignIn.signIn();
    SecureStorage secureStorage = SecureStorage();
    secureStorage.saveGDCredentials(await account!.authHeaders);
    if (kDebugMode) {
      print("User account $account");
      Map<String, String> headers = await account.authHeaders;
      for (String header in headers.keys) {
        print(header);
        print(headers[header]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('images/sidp_logo_splash.png')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email for sidp account'),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: const Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.blue, fontSize: 15),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomePage(
                                title: 'Home page',
                              )));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign in with Google",
              onPressed: () {
                _connectGoogle();
              },
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Ask for your account!')
          ],
        ),
      ),
    );
  }
}
