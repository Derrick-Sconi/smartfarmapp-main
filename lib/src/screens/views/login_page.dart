import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/model/user.dart';
import '../providers/auth_provider.dart';
import '../utils/dialog.dart';
import '../widgets/t_button.dart';
import '../widgets/t_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                SizedBox(height: screenHeight / 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Welcome back! ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'SmartFarm ',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TTextFormField(
                  controller: emailController,
                  iconData: Icons.email,
                  text: 'email',
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                ),
                SizedBox(height: 20),
                TTextFormField(
                  controller: passwordController,
                  iconData: Icons.lock,
                  obscureText: true,
                  text: 'password',
                  validator: (value) => value!.length > 7
                      ? null
                      : "Password has to be more than 6 characters",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/forgot_password');
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                TButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final completer = Completer();
                      showBlockDialog(context, dismissCompleter: completer);

                      final user = User(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      final auth = context.read(authServiceProvider);

                      await auth
                          .signIn(
                        email: user.email,
                        password: user.password,
                      )
                          .then((value) {
                            print(value);
                        completer.complete();
                      }).catchError((onError) {
                        completer.complete();
                        showToast(
                          context,
                          message: 'An error occured try again.',
                        );
                      });
                    }
                  },
                  text: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Does not have account? '),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          letterSpacing: 1.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
