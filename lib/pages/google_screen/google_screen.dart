import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_demo/pages/social_login/social_login_view_model.dart';

class GoogleScreen extends StatefulWidget {
  @override
  GoogleScreenState createState() => GoogleScreenState();
}

class GoogleScreenState extends State<GoogleScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Google User Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    googleUser[i].photoUrl,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Id: ${googleUser[i].id}"),
                  Text("Name: ${googleUser[i].displayName}"),
                  Text("Email: ${googleUser[i].email}"),
                  InkWell(
                    onTap: () {
                      googleSignIn.signOut();
                      googleUser.clear();
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "SignOut",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
