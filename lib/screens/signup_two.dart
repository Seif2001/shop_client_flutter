import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/screens/signup_screen.dart';

class SignUpStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Container(
          padding: EdgeInsets.all(36),
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.store,
              size: 100,
              color: Colors.blue,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your store name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 36),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text("Next",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 5)))
          ]),
        ));
  }
}
