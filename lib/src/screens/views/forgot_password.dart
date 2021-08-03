import 'package:flutter/material.dart';
import 'package:smartfarmapp/src/screens/widgets/password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Password(),
    );
  }
}
