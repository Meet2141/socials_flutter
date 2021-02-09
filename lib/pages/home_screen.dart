import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Social Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            googleSignInButton(),
            facebookSignInButton(),
          ],
        ),
      ),
    );
  }

  googleSignInButton() {
    return Container(

      color: Colors.white,
      child: Text(
        "Google SignIN",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  facebookSignInButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Text(
        "Facebook SignIN",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  dynamicLinkShareButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Text(
        "Dynamic Link Share",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
