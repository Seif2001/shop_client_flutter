import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/screens/signup_one.dart';

import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
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
                    style: GoogleFonts.poppins(
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
                      MaterialPageRoute(builder: (context) => SignupFirst()));
                },
                child: Text("Sign Up",
                    style: GoogleFonts.poppins(
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
