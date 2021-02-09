import 'package:flutter/material.dart';
import 'package:social_demo/pages/social_login/social_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialLoginScreen(),
    );
  }
}
