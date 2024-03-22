import 'package:breakdown_assist/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Admin/Admin Add Notification.dart';
import 'Admin/Admin_home.dart';
import 'Admin/admin login.dart';
import 'Admin/tabs/notification.dart';
import 'Mechanic/Mech Notification.dart';
import 'Mechanic/Mech Service Home.dart';
import 'Mechanic/Mech SignUP.dart';
import 'User/Tabs/User Mechanic List.dart';
import 'User/User Home.dart';
import 'User/User signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mech_Notification()
    );
  }
}
