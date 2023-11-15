import 'package:api_auth/Pages/Home.dart';
import 'package:flutter/material.dart';

import 'Pages/GetOtp.dart';
import 'Pages/Login.dart';
import 'Pages/SignUp.dart';
import 'Utils/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home : '/',
        initialRoute: '/',
        routes: {
        '/': (context) => SignUp(),
        MyRoutes.GetOtpRoutes: (context) => GetOtp(),
        MyRoutes.SignUpRoutes: (context) => SignUp(),
        MyRoutes.LoginRoutes: (context) => Login(),
        MyRoutes.HomeRoutes: (context) => Home(),
        }
    );
  }
}
