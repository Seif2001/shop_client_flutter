import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Signup/signup_phone.dart';

class SignUpName extends StatefulWidget {
  final User user;

  SignUpName({required this.user});

  @override
  _SignUpName createState() => _SignUpName();
}

class _SignUpName extends State<SignUpName> {
  TextEditingController nameController = TextEditingController();

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
              widget.user.isStore ? Icons.store : Icons.shopping_bag_outlined,
              size: 100,
              color: Colors.blue,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                filled: true,
                fillColor: Colors.white,
              ),
              controller: nameController,
            ),
            SizedBox(height: 36),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.user.name = nameController.text;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPhone(user:widget.user)));
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
