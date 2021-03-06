import 'package:flutter/material.dart';

import 'constants.dart';
import 'sizeconfiguration.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style:
              TextStyle(fontSize: sizeConfig.getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/signup'),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: sizeConfig.getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
