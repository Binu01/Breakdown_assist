import 'package:flutter/material.dart';

import 'Admin_home.dart';

class Admin_login extends StatefulWidget {
  const Admin_login({super.key});

  @override
  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
  @override
  void initState() {
    showpassword = true;
  }

  var showpassword;

  var userctrl = TextEditingController();
  var passctrl = TextEditingController();
  final Snack = SnackBar(
      duration: Duration(seconds: 3), content: Text("Successfully Logged in"));
  final _Key = GlobalKey<FormState>();

  Login() {
    if (userctrl.text == 'admin@gmail.com' && passctrl.text == '123456') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Admin_home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
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
                        image: AssetImage("Assets/userORmech img.jpg"))),
                // child: Image.asset("Assets/userORmech img.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Admin Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Username",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: userctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
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
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Password",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  controller: passctrl,
                  obscureText: showpassword,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showpassword = !showpassword;
                            });
                          },
                          icon: showpassword
                              ?  Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_Key.currentState!.validate()) {
                        Login();
                        ScaffoldMessenger.of(context).showSnackBar(Snack);
                      }
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
