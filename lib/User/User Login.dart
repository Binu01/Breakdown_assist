import 'package:flutter/material.dart';

class User_Login extends StatefulWidget {
  const User_Login({super.key});

  @override
  State<User_Login> createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {

  final _key = GlobalKey<FormState>();
  final Snack = SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Successfully Logged in"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Form(
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

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },

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

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },

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
              Padding(
                padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                child: TextButton(onPressed: (){},
                    child: Text("Forgot Password?",style: TextStyle(fontSize: 15,color: Colors.blue),)),
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
                    child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have account ?"),
                  TextButton(onPressed: (){

                    if (_key.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(Snack);
                    }

                  },
                      child: Text("SignUp",style: TextStyle(color: Colors.blue),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}