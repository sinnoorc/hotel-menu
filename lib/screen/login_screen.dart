import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hotel_menu/constants/app_url.dart';
import 'package:hotel_menu/services/app_exceptions.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const users = {
  '12345': '12345',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(seconds: 1);

  Future<String?> _authUser(LoginData data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ConstUrl.login);
    Map body = {
      'name': data.name,
      'password': data.password,
      'user_type': 'Supplier',
    };
    Logger().v(body);
    try {
      var response = await http.post(url, body: body).timeout(const Duration(seconds: 30));
      var json = jsonDecode(response.body);
      if (json['result'] == true) {
        prefs.setString('token', json['token']);
        Logger().w(json['token']);
        return null;
      } else {
        return 'Password does not match';
      }
    } catch (e) {
      AppException.fetchError(e);
    }
    return 'Please try again';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterLogin(
          logo: 'assets/images/clip.png',
          title: 'LOGIN',
          theme: LoginTheme(
            primaryColor: Colors.amber,
            accentColor: Colors.blueAccent,
            errorColor: Colors.red,
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          messages: LoginMessages(
            userHint: 'User id',
          ),
          onLogin: _authUser,
          onSubmitAnimationCompleted: () => Navigator.of(context).pushReplacementNamed('/home'),
          savedEmail: 'Sinnoor',
          savedPassword: '12345678',
          onRecoverPassword: (val) {},

          //  passwordValidator: (val) => null,
          hideForgotPasswordButton: true,
          userValidator: (val) {
            if (val!.isEmpty) {
              return 'User id cannot be empty';
            }
            return null;
          },
        ),
      ),
    );
  }
}
