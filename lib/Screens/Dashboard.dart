import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_app/Screens/Login.dart';
import 'package:leave_app/Screens/form.dart';
import 'package:leave_app/Screens/homescreen.dart';
import 'package:leave_app/Screens/navigation_drawer.dart';
import 'package:leave_app/Screens/card.dart';

import '../DatabaseManager/DatabaseManager.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  State<StatefulWidget> createState() {
    return _dashboard();
    
  }
}

class _dashboard extends State<dashboard> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field
  int _currentIndex=0;
  final List <Widget> _children=[
    HomeScreen(),
    const CustomerForm(),
  ];

   void onTappedBar(int index) {
     setState(() {
       _currentIndex=index;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Employee Leave App'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 75, 136),
      ),
      body:_children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 0, 75, 136),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
            backgroundColor: Color.fromARGB(255, 0, 75, 136),
          ),BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: '',
              backgroundColor: Color.fromARGB(255, 0, 75, 136)),
        ],
      ),
    ); 
  }
}
