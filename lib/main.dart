import 'package:breakdown_assist/Splash.dart';
import 'package:breakdown_assist/user%20or%20mech%20page.dart';
import 'package:flutter/material.dart';

import 'Admin/Admin_home.dart';
import 'Admin/admin login.dart';

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
      home: Admin_home()
    );
  }
}
