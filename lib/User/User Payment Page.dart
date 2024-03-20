import 'package:flutter/material.dart';

class User_Payment_page extends StatefulWidget {
  const User_Payment_page({super.key});

  @override
  State<User_Payment_page> createState() => _User_Payment_pageState();
}

class _User_Payment_pageState extends State<User_Payment_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("Assets/done img.png"),
            ),
            Text("Successfull",style: TextStyle(fontSize: 25),),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
                ),
                onPressed: (){},
                child: Text("Back to home page")),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ) ,
    );
  }
}
