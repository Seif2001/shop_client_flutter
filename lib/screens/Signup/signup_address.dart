import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Signup/signup_password.dart';

class SignUpAddress extends StatefulWidget {
  final User user;

  SignUpAddress({required this.user});

  @override
  _SignUpAddress createState() => _SignUpAddress();
}


class _SignUpAddress extends State<SignUpAddress> {
  TextEditingController addressController = TextEditingController();
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
              Icons.mail_outline,
              size: 100,
              color: Colors.blue,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: addressController,
            ),
            SizedBox(height: 36),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  widget.user.address = addressController.text;
                });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPassword(user:widget.user)));
                },
                child: Text("Next",
                    style: TextStyle(
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
