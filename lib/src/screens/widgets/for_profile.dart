import 'package:flutter/material.dart';
import 'details.dart';
import 'profile_picture.dart';

class ForProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePicture(),
          Divider(
            height: 60.0,
            color: Colors.grey[800],
          ),
          Details(),
        ],
      ),
    );
  }
}
