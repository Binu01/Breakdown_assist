import 'package:flutter/material.dart';

class Mech_Edit_Profile extends StatefulWidget {
  const Mech_Edit_Profile({super.key});

  @override
  State<Mech_Edit_Profile> createState() => _Mech_Edit_ProfileState();
}

class _Mech_Edit_ProfileState extends State<Mech_Edit_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
               SizedBox(
                height: 50,
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
                       SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                        child: IconButton(onPressed: (){},
                            icon:  Icon(Icons.edit)),
                      )
                    ],
                  ),
                ],
              ),
               SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Name"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Username"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Phone Number"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Email"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Experience"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Location"
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Shop Name"
                  ),
                ),
              ),
               SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize:  Size(150, 30),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onPressed: (){},
                  child:  Text("Done",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
