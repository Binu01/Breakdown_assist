import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("UserDetails").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final _user = snapshot.data?.docs ?? [];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: ListView.builder(

              itemCount: _user.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    color: Colors.white,
                    width: 330,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("Assets/profile img.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(_user[index]['username'], style: TextStyle(fontSize: 17)),
                            Text("Location", style: TextStyle(fontSize: 17)),
                            Text(_user[index]['phone number'], style: TextStyle(fontSize: 17)),
                            Text(_user[index]['email id'], style: TextStyle(fontSize: 17)),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
