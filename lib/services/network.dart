import 'dart:convert';

import 'package:brikoula_client_app/models/serverReponses.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as server;

class Network {
  Future<AuthResponse> login(
      {@required String route,
      @required String email,
      @required String password}) async {
    server.Response response =
        await server.post('baseurl$route?email=$email&password=$password');

    String data = response.body;
    var responseData = json.decode(data);
    if (response.statusCode == 200) {
      return AuthResponse(
        responseData['status'],
        responseData['token'],
      );
    } else if (response.statusCode == 401) {
      return AuthResponse.failed(
          responseData['status'], responseData['message']);
    } else {
      print(response.statusCode);
      print(response.body);
      return AuthResponse.failed(
          responseData['status'], responseData['message']);
    }
  }

  Future<AuthResponse> register(
      {@required String route,
      @required String name,
      @required String phone,
      @required String email,
      @required String password}) async {
    server.Response response = await server.post(
        'baseurk$route?name=$name&phone=$phone&email=$email&password=$password');

    String data = response.body;
    print(data);
    var responseData = jsonDecode(data);

    if (response.statusCode == 200) {
      return AuthResponse(
        responseData['status'],
        responseData['token'],
      );
    } else if (response.statusCode == 401) {
      return AuthResponse.failed(
        responseData['status'],
        responseData['message'],
      );
    }else {
      print(responseData['status']);
      print(responseData['message']);
      return AuthResponse.failed(
        responseData['status'],
        responseData['message'],
      );
    }
  }
}
