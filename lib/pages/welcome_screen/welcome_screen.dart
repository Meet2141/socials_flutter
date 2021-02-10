import 'package:flutter/material.dart';
import 'package:social_demo/pages/social_login/social_login_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text("Welcome refer code $referCode"),
      ),
    ));
  }
}
