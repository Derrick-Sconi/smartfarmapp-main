import 'package:flutter/material.dart';
import 'package:smartfarmapp/src/screens/widgets/body.dart';


class LoginSuccessScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}