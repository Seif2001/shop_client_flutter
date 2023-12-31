import 'package:flutter/material.dart';
import 'package:shop_app/Models/user.dart';
import 'package:shop_app/screens/Products/products_list.dart';
import 'package:shop_app/services/users.dart';

class SignUpPassword extends StatefulWidget {
  final User user;

  SignUpPassword({required this.user});

  @override
  _SignUpPassword createState() => _SignUpPassword();
}

class _SignUpPassword extends State<SignUpPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              Icons.password,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
              controller: confirmPasswordController,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords do not match'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  } else if (passwordController.text.length < 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password must be at least 8 characters'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  } else {
                    widget.user.password = passwordController.text;
                  }
                  bool registered = await UserService.registerUser(widget.user);
                  if (registered == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('User already exists'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('User created successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductListWidget()));
                  }
                },
                child: Text("Sign Up",
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
