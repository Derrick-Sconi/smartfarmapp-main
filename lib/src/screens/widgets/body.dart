import 'package:flutter/material.dart';

import 'sizeconfiguration.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: sizeConfig.getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: SizedBox(
            width: double.infinity,
            height: sizeConfig.getProportionateScreenHeight(56),
            child: TextButton(
              child: Text("Let's go farming!"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/bottomNavigation');
              },
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
