import 'package:flutter/material.dart';

import 'alerts.dart';
import 'homepage.dart';
import 'crop_recommend.dart';
import 'profile.dart';



class BottomNavigationScreen extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PlantInfo(),
    Alerts(),
    ProfileScreen()
  ];

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: BottomNavigationScreen._widgetOptions.elementAt(_selectedBottomNavIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: '',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black87,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
