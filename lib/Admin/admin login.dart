import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Admin_login extends StatefulWidget {
  const Admin_login({super.key});

  @override
  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
            ),
            Container(
              height: 200,
              width: 400,
              child: Image.asset("Assets/userORmech img.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(
              height: 20,
            ),
            Text("Enter Username",style: TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    hintText: 'Username',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Enter Password",style: TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor:Colors.white
                  ),
                  onPressed: (){},
                  child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
