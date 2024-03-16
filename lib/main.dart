import 'package:breakdown_assist/Splash.dart';
import 'package:breakdown_assist/user%20or%20mech%20page.dart';
import 'package:flutter/material.dart';

import 'Admin/Admin Add Notification.dart';
import 'Admin/Admin Mechanic.dart';
import 'Admin/Admin user.dart';
import 'Admin/Admin_home.dart';
import 'Admin/admin login.dart';
import 'Admin/tabs/Mechanic list.dart';
import 'Admin/tabs/User_list.dart';
import 'Admin/tabs/home.dart';
import 'Mechanic/Mech Edit Profile.dart';
import 'Mechanic/Mech Login.dart';
import 'Mechanic/Mech Notification.dart';
import 'Mechanic/Mech Service Home.dart';
import 'Mechanic/Mech SignUP.dart';
import 'Mechanic/Mech profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mech_Home()
    );
  }
}
