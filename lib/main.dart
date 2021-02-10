import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_demo/pages/social_login/social_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialLoginScreen(),
    );
  }
}
