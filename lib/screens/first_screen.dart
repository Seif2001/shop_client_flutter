import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Signup/signup_one.dart';

import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  User user = User.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 10),
                    padding:
                        EdgeInsets.symmetric(horizontal: 75, vertical: 5))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupFirst(user: user,)));
                },
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 10),
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 5)))
          ])),
    );
  }
}
