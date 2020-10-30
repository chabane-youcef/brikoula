import 'package:brikoula_client_app/constants/colors.dart';
import 'package:brikoula_client_app/services/push_notifications.dart';
import 'package:brikoula_client_app/ui/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    PushNotificationsManager().init(context);
    Duration duration = Duration(seconds: 3);
    Future.delayed(duration, () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/ic_big_logo.png'),
              SizedBox(
                height: 25,
              ),
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
