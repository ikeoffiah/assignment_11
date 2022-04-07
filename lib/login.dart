import 'package:db_test/dash.dart';
import 'package:db_test/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Positioned(
              top: 120,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, color: Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email/Username",
                              hintStyle: TextStyle(
                                color: Color(0xff2eB886),
                                fontSize: 20,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Color(0xff2eB886),
                                fontSize: 20,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.green,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dash()));
                          },
                          child: Text('Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
