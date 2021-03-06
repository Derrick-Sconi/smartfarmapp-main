import 'package:flutter/material.dart';
import 'package:smartfarmapp/src/screens/widgets/constants.dart';
import 'package:smartfarmapp/src/screens/widgets/custom_surfix_icon.dart';
import 'package:smartfarmapp/src/screens/widgets/form_error.dart';
import 'package:smartfarmapp/src/screens/widgets/no_accounts_text.dart';
import 'package:smartfarmapp/src/screens/widgets/sizeconfiguration.dart';

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: sizeConfig.getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _forgotPasswordKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String? email;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    var getProportionateScreenHeight2 = sizeConfig.getProportionateScreenHeight;

    return Form(
      key: _forgotPasswordKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight2(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          TextButton(
            child: Text("Continue"),
            onPressed: () {
              if (_forgotPasswordKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, '/bottomNavigation');
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
