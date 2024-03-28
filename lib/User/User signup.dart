import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'User Login.dart';

class User_SignUp extends StatefulWidget {
  const User_SignUp({super.key});

  @override
  State<User_SignUp> createState() => _User_SignUpState();
}

class _User_SignUpState extends State<User_SignUp> {
  var userctrl = TextEditingController();
  var phnctrl = TextEditingController();
  var emailctrl = TextEditingController();
  var passctrl = TextEditingController();
  var locationctrl = TextEditingController();

  Future<dynamic> UserSignup() async {
    await FirebaseFirestore.instance.collection('UserDetails').add({
      'username': userctrl.text,
      'phone number': phnctrl.text,
      'email id': emailctrl.text,
      'password': passctrl.text,
      'location':locationctrl.text,
      'path':'',
      'status': 0,
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => User_Login()));
    });
  }

  final _key = GlobalKey<FormState>();
  final Snack = SnackBar(
      duration: Duration(seconds: 4),
      content: Text("Your Account was Successfully Created"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: Image.asset("Assets/userORmech img.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "User Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    color: Colors.deepPurple),
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
                      style: TextStyle(fontSize: 20),
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
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Phone Number",
                      style: TextStyle(fontSize: 20),
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
                  keyboardType: TextInputType.number,
                  controller: phnctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
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
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Your Email",
                      style: TextStyle(fontSize: 20),
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
                  controller: emailctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
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
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Your Location",
                      style: TextStyle(fontSize: 20),
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
                  controller: locationctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Location',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Your Password",
                      style: TextStyle(fontSize: 20),
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
                  obscureText: true,
                  controller: passctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Your Password',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        backgroundColor: Colors.deepPurple.shade400,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        UserSignup();
                        ScaffoldMessenger.of(context).showSnackBar(Snack);
                      }
                    },
                    child: Text(
                      "SignUp",
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
