import 'package:db_test/home_page.dart';
import 'package:db_test/tracking/tracking_usage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[
        TrackingUsage().appAnalyticsObserver()
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
