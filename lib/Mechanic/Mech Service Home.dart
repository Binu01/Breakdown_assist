import 'package:breakdown_assist/Mechanic/Tabs/Rating%20Tab.dart';
import 'package:breakdown_assist/Mechanic/Tabs/Request%20Tab.dart';
import 'package:breakdown_assist/Mechanic/Tabs/Service%20Tab.dart';
import 'package:flutter/material.dart';

class Mech_Home extends StatefulWidget {
  const Mech_Home({super.key});

  @override
  State<Mech_Home> createState() => _Mech_HomeState();
}

class _Mech_HomeState extends State<Mech_Home> {
  @override
  int indexNum = 0;
  List Tabs = [
    Request_Tab(),
    Service_Tab(),
    Rating_Tab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue.shade100,
          selectedItemColor: Colors.blue.shade900,
          items: [
            BottomNavigationBarItem(
              icon: Icon( Icons.person),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.home_repair_service),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.star),
              label: 'Rating',
            ),
          ],
          showUnselectedLabels: false,
          iconSize: 25,
          currentIndex: indexNum,
          onTap: (int num) {
            setState(() {
              indexNum = num;
            });
          }),
      body: Tabs.elementAt(indexNum),
    );
  }
}
