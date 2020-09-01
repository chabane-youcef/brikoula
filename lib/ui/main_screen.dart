import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('onMessage called: $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('onResume called: $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('onLaunch called: $message');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Hello ..."),
        ),
      ),
    );
  }
}
