import 'package:flutter/material.dart';
import 'package:miotech_flutter_demo/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({this.onLogin});
  final onLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 200.0,
              child: Image.asset('assets/logo-text.png'),
            ),
            Container(
              width: 280.0,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                color: MioColors.fifth,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
                ),
                cursorColor: MioColors.secondary,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 280.0,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                color: MioColors.fifth,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: MioColors.secondary.withOpacity(0.6)),
                ),
                obscureText: true,
                cursorColor: MioColors.secondary,
              ),
            ),
            SizedBox(height: 32.0),
            GestureDetector(
              onTap: onLogin,
              child: Container(
                width: 280.0,
                height: 44.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffaa8741),
                      MioColors.brand,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(child: Text('Login')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
