import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_demo/pages/social_login/social_login.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  initState() {
    super.initState();
    disableCapture();
  }

  // Screenshot or video capture not allowed
  Future<void> disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialLoginScreen(),
    );
  }
}
