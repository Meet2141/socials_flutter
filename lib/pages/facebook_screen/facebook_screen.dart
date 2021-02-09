import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:social_demo/pages/social_login/social_login_view_model.dart';

class FacebookScreen extends StatefulWidget {
  @override
  FacebookScreenState createState() => FacebookScreenState();
}

class FacebookScreenState extends State<FacebookScreen> {
  FacebookLogin facebookSignIn = new FacebookLogin();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());

    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "Facebook User Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                 // Text("Id: ${facebookUser[i].id}"),
                 //  Text("Name: ${facebookUser[i].first_name}"),
                 //  Text("Name: ${facebookUser[i].last_name}"),
                 //  Text("Email: ${facebookUser[i].email}"),
                  InkWell(
                    onTap: () {
                      facebookSignIn.logOut();
                      facebookUser.clear();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
