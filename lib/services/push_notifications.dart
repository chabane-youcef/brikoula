import 'dart:io';
import 'package:brikoula_client_app/controllers/notifications_pusher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';


class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
  PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init(BuildContext context) async {
    if (!_initialized) {
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          String title = message['notification']['title'];
          String body = message['notification']['body'];
          NotificationsPusher().initialize(context).then((pusher) {
            pusher.showNotification(title, body, '');
          });
        },
        onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
        },
      );
      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _initialized = true;
    }
  }

  Future<String> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  String title = message['notification']['title'];
  String body = message['notification']['body'];
  NotificationsPusher().initialize(null).then((pusher) {
    pusher.showNotification(title, body, '');
  });
}