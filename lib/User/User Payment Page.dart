import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'User Home.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
                height: 200,
                width: 200,
                child: Lottie.asset('Assets/Animation - 1712227968109.json')),
            Text(
              "Successfull",
              style: TextStyle(fontSize: 25),
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => User_Home()));
                },
                child: Text("Back to home page")),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
