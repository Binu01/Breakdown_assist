import 'package:flutter/material.dart';

class User_SignUp extends StatefulWidget {
  const User_SignUp({super.key});

  @override
  State<User_SignUp> createState() => _User_SignUpState();
}

class _User_SignUpState extends State<User_SignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 400,
              child: Image.asset("Assets/userORmech img.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Username",style: TextStyle(fontSize: 20),),
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
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Phone Number",style: TextStyle(fontSize: 20),),
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
                  hintText: 'Phone Number',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Your Email",style: TextStyle(fontSize: 20),),
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
                  hintText: 'Enter Email',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text("Enter Your Password",style: TextStyle(fontSize: 20),),
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
                  hintText: 'Enter Your Password',
                ),
              ),
            ),
            SizedBox(
              height: 50,
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
                  child: Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
      ),

    );
  }
}
