import 'package:flutter/material.dart';
import 'package:shop_app/screens/Products/products_list.dart';
import 'package:shop_app/services/users.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Number',
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              controller: numberController,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await UserService.loginUser(
                  numberController.text,
                  passwordController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListWidget(),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
