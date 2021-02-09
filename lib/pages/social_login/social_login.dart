import 'package:flutter/material.dart';
import 'package:social_demo/pages/social_login/social_login_view_model.dart';

class SocialLoginScreen extends StatefulWidget {
  @override
  SocialLoginScreenState createState() => SocialLoginScreenState();
}

class SocialLoginScreenState extends State<SocialLoginScreen> {
  SocialLoginViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = SocialLoginViewModel(this));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Social Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            googleSignInButton(),
            facebookSignInButton(),
            dynamicLinkShareButton()
          ],
        ),
      ),
    );
  }

  googleSignInButton() {
    return InkWell(
      onTap: (){
        model.gSignIn();
      },
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(
            "Google SignIN",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  facebookSignInButton() {
    return InkWell(
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(
            "Facebook SignIN",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  dynamicLinkShareButton() {
    return InkWell(
      onTap: () {
        model.generateDynamicLink();
      },
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(
            "Dynamic Link Share",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
