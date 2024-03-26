import 'package:breakdown_assist/User/User%20Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }
 var ID;
  void getdata()async{
    final data = await SharedPreferences.getInstance();
    ID = data.getString('id')!;
    setState(() {

    });

  }
  DocumentSnapshot? user;

  Getupdateddata() async {
    user =
    await FirebaseFirestore.instance.collection('UserDetails').doc(ID).get();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:Getupdateddata() ,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("Assets/profile img.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 270, 0),
                    child: Text("Name",style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          hintText: user!['username']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 190, 0),
                    child: Text(
                      maxLines: 1,
                      "Phone Number",style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          hintText: user!['phone number']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
                    child: Text("Email",style: TextStyle(fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: user!['email id'],
                        hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 170,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize:  Size(150, 40),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_Home()));
                      },
                      child:  Text("Done",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
