import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech Service Home.dart';
import 'Mech SignUP.dart';

class Mech_Login extends StatefulWidget {
  const Mech_Login({super.key});

  @override
  State<Mech_Login> createState() => _Mech_LoginState();
}

class _Mech_LoginState extends State<Mech_Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showpassword = true;
  }

  var showpassword;
  var mailctrl = TextEditingController();
  var passctrl = TextEditingController();

  final _key = GlobalKey<FormState>();

  String id = '';
  String name = '';
  String email = '';
  String phone = '';
  String experience = '';
  String location = '';
  String shopname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: Image.asset("Assets/userORmech img.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mechanic Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent),
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
                  controller: mailctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.lightBlue.shade100,
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
                    fillColor: Colors.lightBlue.shade100,
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
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                    )),
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
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Mechlogin();
                      }
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mech_SignUp()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Mechlogin() async {
    final mech = await FirebaseFirestore.instance
        .collection('mechanics')
        .where('email id', isEqualTo: mailctrl.text)
        .where('password', isEqualTo: passctrl.text)
        .where('status', isEqualTo: 1)
        .get();
    if (mech.docs.isNotEmpty) {
      id = mech.docs[0].id;
      name = mech.docs[0]['username'];
      email = mech.docs[0]['email id'];
      phone = mech.docs[0]['phone number'];
      experience = mech.docs[0]['work experience'];
      shopname = mech.docs[0]['shop name'];

      SharedPreferences data = await SharedPreferences.getInstance();

      data.setString('id', id);
      data.setString('username', name);
      data.setString('emailid', email);
      data.setString('phonenumber', phone);
      data.setString('workexperience', experience);
      data.setString('shopname', shopname);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mech_Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Username and Password Error",
        style: TextStyle(color: Colors.red, backgroundColor: Colors.white),
      )));
    }
  }
}
