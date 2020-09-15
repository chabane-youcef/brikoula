import 'package:brikoula_client_app/controllers/toaster.dart';
import 'package:brikoula_client_app/models/serverReponses.dart';
import 'package:brikoula_client_app/services/network.dart';
import 'package:brikoula_client_app/ui/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticator {
  static Authenticator instance;

  static Future<bool> logIn(
      BuildContext context, String email, String psw) async {
    try {
      AuthResponse response = await Network().login(
        route: '/api/login',
        email: email,
        password: psw,
      );

      if (response.status) {
        print('status ${response.status} token : ${response.apiToken}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
        prefs.setString('api_token', response.apiToken);
        prefs.setString('email', email);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainScreen(
            )));
        Toaster.showBasicToast('Logged in successfully');
      } else {
        Toaster.showErrorToast(response.msg);
        print(response.msg);
      }
    } catch (e) {
      Toaster.showErrorToast(
          'failed to connect to server, please check you network');
    }
  }
}