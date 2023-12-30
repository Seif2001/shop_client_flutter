import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Signup/signup_address.dart';
import 'package:shop_app/services/users.dart';

class SignUpPhone extends StatefulWidget {
  final User user;

  SignUpPhone({required this.user});

  @override
  _SignUpPhone createState() => _SignUpPhone();
}

class _SignUpPhone extends State<SignUpPhone> {
  TextEditingController phoneController = TextEditingController();

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
              Icons.phone_android,
              size: 100,
              color: Colors.blue,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Phone Number',
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),
            SizedBox(height: 36),
            ElevatedButton(
                onPressed: () async {
                  bool check =
                      await UserService.checkNumber(phoneController.text);
                  if (check == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Phone number already exists'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  setState(() {
                    widget.user.phone = phoneController.text;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignUpAddress(user: widget.user)));
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
