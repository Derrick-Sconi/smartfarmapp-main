import 'package:flutter/material.dart';
import 'sizeconfiguration.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    required Key key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: Image.asset(
        svgIcon,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}
