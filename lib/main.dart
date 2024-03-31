import 'package:breakdown_assist/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Admin/Admin user.dart';
import 'Admin/Admin_home.dart';
import 'Admin/admin login.dart';
import 'Admin/tabs/User_list.dart';
import 'Admin/tabs/notification.dart';
import 'Mechanic/Mech Login.dart';
import 'Mechanic/Mech Notification.dart';
import 'Mechanic/Mech Service Home.dart';
import 'Mechanic/Mech SignUP.dart';
import 'Mechanic/Mech profile.dart';
import 'User/Tabs/User Mechanic List.dart';
import 'User/User Home.dart';
import 'User/User Login.dart';
import 'User/User Mechanic Details Page.dart';
import 'User/User Nofification.dart';
import 'User/User Profile.dart';
import 'User/User signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Admin_login());
  }
}
