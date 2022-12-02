import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffffffff),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                      // child: Center(
                      //   child: Text(
                      //     "Welcome back !",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 50,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(25, 0, 0, 0), //0, 0, 0, 0.25
                          blurRadius: 9.0,
                          spreadRadius: 0,
                          offset: Offset(
                            4,
                            4,
                          ),
                        ),
                        BoxShadow(
                          color:
                              Color.fromARGB(8, 138, 138, 138), //0, 0, 0, 0.25
                          blurRadius: 3.0,
                          spreadRadius: 0,
                          offset: Offset(
                            -1,
                            0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 398, //350
                    width: 293, //250
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: Text(
                          //   'Sign Up',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 28,
                          //     letterSpacing: 1,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 40, 0),
                          child: Text(
                            'Enter E-mail Address:',
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 16,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 189, 189, 189),
                          thickness: 1,
                          indent: 36,
                          endIndent: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 40, 0),
                          child: Text(
                            'Enter Password:',
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 16,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 189, 189, 189),
                          thickness: 1,
                          indent: 36,
                          endIndent: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 68, 0),
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                              //fontWeight: FontWeight(1),
                              color: Color.fromARGB(201, 213, 212, 212),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
              ],
            )));
  }
}
