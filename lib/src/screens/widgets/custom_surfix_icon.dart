import 'package:flutter/material.dart';

import 'sizeconfiguration.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({Key? key, required this.svgIcon}) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        sizeConfig.getProportionateScreenWidth(20),
        sizeConfig.getProportionateScreenWidth(20),
        sizeConfig.getProportionateScreenWidth(20),
      ),
      child: Icon(Icons.mail),
    );
  }
}
