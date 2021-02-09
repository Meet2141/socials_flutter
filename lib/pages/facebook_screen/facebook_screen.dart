import 'package:flutter/material.dart';

class FacebookScreen extends StatefulWidget {
  @override
  FacebookScreenState createState() => FacebookScreenState();
}

class FacebookScreenState extends State<FacebookScreen> {
  @override
  Widget build(BuildContext context) {
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
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
