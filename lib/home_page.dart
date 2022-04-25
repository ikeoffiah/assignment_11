import 'package:db_test/app_database.dart';
import 'package:db_test/dash.dart';
import 'package:db_test/login.dart';
import 'package:db_test/tracking/tracking_usage.dart';
import 'package:flutter/material.dart';
import 'package:db_test/db_operations.dart';
import 'package:db_test/signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    testDB();
    super.initState();

    TrackingUsage().sendAnalyticsEvent("event");
  }

  void testDB() async {
    var database = await AppDataBase().initdb();
    DBOperations(database).users().then((value) => {
          if (value.length > 0)
            {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => dash()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                onPressed: () {
                  TrackingUsage().setCurrentScreen("Home");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text(
                  'Get started',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
