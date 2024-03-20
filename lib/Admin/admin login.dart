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
      backgroundColor: Colors.blue.shade50,
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/userORmech img.jpg"))
              ),
              // child: Image.asset("Assets/userORmech img.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Username",style: TextStyle(fontSize: 25),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  ),
                    hintText: 'Username',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Password",style: TextStyle(fontSize: 25),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 120,
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
