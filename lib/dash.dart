import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class dash extends StatefulWidget {
  const dash({Key? key}) : super(key: key);

  @override
  _dashState createState() => _dashState();
}

class _dashState extends State<dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Text(
          'Welcome to your dashboard',
          style: TextStyle(color: Colors.green, fontSize: 40),
        ),
      ),
    ));
  }
}
