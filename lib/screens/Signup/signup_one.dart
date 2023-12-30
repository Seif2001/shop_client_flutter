import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Signup/signup_name.dart';
class SignupFirst extends StatefulWidget {
  final User user;

  SignupFirst({required this.user});

  @override
  _SignupFirst createState() => _SignupFirst();
}


class _SignupFirst extends State<SignupFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  widget.user.isStore = false;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpName(user: widget.user)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 50,
                    ),
                    SizedBox(height: 8),
                    Text("Customer",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Add some spacing between buttons

            SizedBox(
                width: 200,
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    widget.user.isStore = true;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpName(user: widget.user,)));
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.store, size: 50),
                        Text("Store",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
