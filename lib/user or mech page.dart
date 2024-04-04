import 'package:flutter/material.dart';

import 'Admin/admin login.dart';
import 'Mechanic/Mech Login.dart';
import 'User/User Login.dart';

class UserOrMech extends StatefulWidget {
  const UserOrMech({super.key});

  @override
  State<UserOrMech> createState() => _UserOrMechState();
}

class _UserOrMechState extends State<UserOrMech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 400,
            child: Image.asset("Assets/login page img.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Who Are You",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_Login()));
                },
                child: Text("Mechanic",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.blue.shade100,
                    foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>User_Login()));
                },
                child: Text("User",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_login()));
              },
              child: Text("Admin Login",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
