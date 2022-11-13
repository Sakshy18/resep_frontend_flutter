import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:resep/pages/home_page.dart';
import 'package:resep/pages/login_page.dart';
import 'package:resep/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loggedIn = false;
  final registerButtonStyle = ElevatedButton.styleFrom(
      primary: Color(0xff3A7B99),
      onPrimary: Colors.white,
      padding: EdgeInsets.all(20),
      minimumSize: Size(double.maxFinite, 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));

  void checkLoggedIn() async {
    String jwt = await storage.read(key: 'jwt') ?? '';
    print(jwt);
    if (jwt == '') return;
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_pic.png'),
                  fit: BoxFit.fill)),
          height: MediaQuery.of(context).size.height * 0.65,
          child: Center(child: Text('')),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            'Discover your favourite products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'from your phone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text(
              'Register',
              style: TextStyle(fontSize: 18),
            ),
            style: registerButtonStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(fontSize: 15),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ))
          ],
        )
      ],
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
