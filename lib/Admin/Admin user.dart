import 'package:flutter/material.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({super.key});

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60
          ),
          child: Container(
            height:700,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("Assets/profile img.png"),
                    ),

                Text("Name",style: TextStyle(fontSize: 20),),
                Text("Location",style: TextStyle(fontSize: 20),),
                  ],
                ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text("Username",style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Username"
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text("Phone Number",style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: "0000000000"
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text("Email Address",style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: "Example@gmail.com"
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            backgroundColor: Colors.green.shade300,
                            foregroundColor: Colors.white
                        ),
                        onPressed: (){},
                        child: Text("Accept",style: TextStyle(fontSize: 20))),
                SizedBox(
                  width: 75,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      backgroundColor: Colors.red.shade300,
                        foregroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Text("Reject",style: TextStyle(fontSize: 20),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
