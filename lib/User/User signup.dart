import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'User Login.dart';

class User_SignUp extends StatefulWidget {
  const User_SignUp({super.key});

  @override
  State<User_SignUp> createState() => _User_SignUpState();
}

class _User_SignUpState extends State<User_SignUp> {
  List<String> locations = [
    'Thiruvananthapuram',
    'Kollam',
    'Alappuzha',
    'Pathanamthitta',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasaragod'
  ];
  String? selectedLocation;

  var userctrl = TextEditingController();
  var phnctrl = TextEditingController();
  var emailctrl = TextEditingController();
  var passctrl = TextEditingController();

  Future<dynamic> UserSignup() async {
    await FirebaseFirestore.instance.collection('UserDetails').add({
      'username': userctrl.text,
      'phone number': phnctrl.text,
      'email id': emailctrl.text,
      'password': passctrl.text,
      'location': selectedLocation,
      'path': '',
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
      backgroundColor: Colors.white,
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
                    fillColor: Colors.lightBlue.shade100,
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
                    fillColor: Colors.lightBlue.shade100,
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
                    fillColor: Colors.lightBlue.shade100,
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
                    fillColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Your Password',
                  ),
                ),
              ),
              DropdownButton<String>(
                dropdownColor: Colors.lightBlue.shade50,
                iconEnabledColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(color: Colors.black, fontSize: 20),
                hint: Text("select your location"),
                value: selectedLocation, // Current selected location
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue!;
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      UserSignup();
                      ScaffoldMessenger.of(context).showSnackBar(Snack);
                    }
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
