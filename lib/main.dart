import 'package:flutter/material.dart';
import 'package:otp_verification/screens/home_page.dart';
import 'package:otp_verification/screens/login_page.dart';
import 'package:otp_verification/screens/otp_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

