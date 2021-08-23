import 'package:flutter/material.dart';
import 'sizeconfiguration.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(context, error: errors[index]),
      ),
    );
  }

  Row formErrorText(BuildContext context, {required String error}) {
    final sizeConfig = SizeConfig(context);
    return Row(
      children: [
        Image.asset(
          "assets/icons/Error.svg",
          height: sizeConfig.getProportionateScreenWidth(14),
          width: sizeConfig.getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: sizeConfig.getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
