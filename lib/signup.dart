import 'package:db_test/login.dart';
import 'package:flutter/material.dart';
import 'package:db_test/db_operations.dart';
import 'package:db_test/app_database.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                          controller: emailController,
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
                          controller: firstNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "First Name",
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
                          controller: lastNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Last Name",
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
                          controller: passwordController,
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
                          onPressed: () async {
                            WidgetsFlutterBinding.ensureInitialized();
                            //open the database and store the reference

                            final db = await AppDataBase().initdb();

                            DBOperations(db).insertRecord(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passwordController.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text('Signup',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User',
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green)),
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
