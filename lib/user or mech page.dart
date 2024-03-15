import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          Container(
            height: 200,
            width: 400,
            child: Image.asset("Assets/userORmech img.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Who Are You",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 300,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor:Colors.white
              ),
              onPressed: (){},
              child: Text("Mechanic",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
          ),
        ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white
              ),
                onPressed: (){},
                child: Text("User",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
            ),
          ),
          SizedBox(
            height: 20,
          ),
      TextButton(onPressed: (){},
          child: Text("Admin Login",style: TextStyle(color: Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.bold))),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor:Colors.white,
                backgroundColor: Colors.blueAccent

              ),
              onPressed: (){},
              child: Text("Continue",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
