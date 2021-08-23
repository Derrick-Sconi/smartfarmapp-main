import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartfarmapp/src/screens/providers/app_providers.dart';
import 'package:smartfarmapp/src/screens/providers/auth_provider.dart';
import '../../../core/model/user.dart';
import '../utils/dialog.dart';

import '../widgets/t_button.dart';
import '../widgets/t_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final usernameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
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
                    SizedBox(height: 20),
                    TTextFormField(
                      controller: usernameController,
                      iconData: Icons.lock,
                      text: 'username',
                      validator: (value) =>
                          value!.isNotEmpty ? null : "Username is required",
                    ),
                    SizedBox(height: 50.0),
                    TButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final completer = Completer();
                          showBlockDialog(context, dismissCompleter: completer);

                          var user = User(
                            name: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          final auth = context.read(authServiceProvider);
                          final userDataSource =
                              context.read(userDataSourceProvider);

                          await auth
                              .signUp(
                            email: user.email,
                            password: user.password,
                          )
                              .then((uid) async {
                            user = user.copy(uid: uid);
                            await userDataSource.addUser(user);
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
                      text: 'Sign up',
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 60.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ]));
  }
}
