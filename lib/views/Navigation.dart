import 'package:covtracker/pages/help.dart';
import 'package:covtracker/views/homepage.dart';
import 'package:covtracker/views/India.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covtracker/views/info_screen.dart';
import 'country_list.dart';

class Navigation extends StatefulWidget {


  @override
  _NavigationState createState() => _NavigationState();
}
class _NavigationState extends State<Navigation>{
  int _currentIndex = 0;

  List<Widget> _widgets = <Widget> [
    HomePage(),
    CountryListPage(),
    India(),
    InfoScreen(),
    Helpline()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Global'),
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Countries'),
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('India'),
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('Info'),
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Helpline'),
              backgroundColor: Colors.blueAccent
          ),
        ],
      ),
      body: _widgets.elementAt(_currentIndex),
    );
  }}