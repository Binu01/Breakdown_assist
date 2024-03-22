import 'package:breakdown_assist/Mechanic/Mech%20Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mech_SignUp extends StatefulWidget {
  const Mech_SignUp({super.key});

  @override
  State<Mech_SignUp> createState() => _Mech_SignUpState();
}

class _Mech_SignUpState extends State<Mech_SignUp> {

  var userctrl = TextEditingController();
  var phnctrl = TextEditingController();
  var emailctrl = TextEditingController();
  var expctrl = TextEditingController();
  var shopctrl = TextEditingController();
  var passctrl = TextEditingController();

  Future<dynamic>MechSignup()async{
    await FirebaseFirestore.instance.collection('mechanics').add({
      'username': userctrl.text,
      'phone number': phnctrl.text,
      'email id': emailctrl.text,
      'work experience' : expctrl.text,
      'shop name' : shopctrl.text,
      'password': passctrl.text,
      'status': 0,
    }).then((value) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_Login()));
    }
    );
    print("done");
  }
  final Snack = SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Your Account was Successfully Created"));
  final _Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
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
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Phone Number',
                  ),
                ),
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
                    child: Text("Enter Your Work Experience",style: TextStyle(fontSize: 20),),
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

                  controller: expctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Work Experience',
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
                    child: Text("Enter Your Work Shop Name",style: TextStyle(fontSize: 20),),
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

                  controller: shopctrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Work shop Name',
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
                    child: Text("Enter Password",style: TextStyle(fontSize: 20),),
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
                    onPressed: (){

                      if (_Key.currentState!.validate()) {
                        MechSignup();
                        ScaffoldMessenger.of(context).showSnackBar(Snack);
                      }

                    },
                    child: Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
