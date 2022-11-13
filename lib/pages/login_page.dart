import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

import 'package:resep/pages/home_page.dart';

const SERVER_IP = 'http://192.168.1.167:8000';
final storage = FlutterSecureStorage();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final loginButtonStyle = ElevatedButton.styleFrom(
      primary: Color(0xff3A7B99),
      onPrimary: Colors.white,
      padding: EdgeInsets.all(20),
      minimumSize: Size(double.maxFinite, 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));

  Future logIn(String email, String password) async {
    var client = http.Client();
    print('before');
    var res = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/v1/user/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email, "password": password}));
    print('after');
    print(json.decode(res.body)['success']);
    if (json.decode(res.body)['success'] == true) {
      storage.write(key: 'jwt', value: json.decode(res.body)['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xff3A7B99), elevation: 0, primary: true),
      body: SafeArea(
          child: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xff3A7B99),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 50),
                        child: Text(
                          'Welcome',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: emailTextController,
              decoration: InputDecoration(
                  labelText: 'Enter email', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Enter password', border: OutlineInputBorder()),
            ),
          ),
          Center(
            child: Text('Forgot Password?'),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => RegisterPage()));
                logIn(emailTextController.text, passwordTextController.text);
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
              style: loginButtonStyle,
            ),
          ),
        ],
      )),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
