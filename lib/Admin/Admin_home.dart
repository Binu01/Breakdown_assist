import 'package:breakdown_assist/Admin/tabs/home.dart';
import 'package:breakdown_assist/Admin/tabs/notification.dart';
import 'package:breakdown_assist/Admin/tabs/payment.dart';
import 'package:flutter/material.dart';

class Admin_home extends StatefulWidget {
  const Admin_home({super.key});

  @override
  State<Admin_home> createState() => _Admin_homeState();
}

class _Admin_homeState extends State<Admin_home> {
  @override
  int _indexno = 0;
  List Tabs = [
    HomeTab(),
    PaymentTab(),
    NotificationTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: CircleAvatar(
            backgroundImage: AssetImage("Assets/profile img.png"),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: 'Notification',
          ),
        ],
        showUnselectedLabels: false,
        iconSize: 25,
        currentIndex: _indexno,
        onTap: (int num) {
          setState(() {
            _indexno = num;
          });
        },
      ),
      body: Tabs.elementAt(_indexno),
    );
  }
}
