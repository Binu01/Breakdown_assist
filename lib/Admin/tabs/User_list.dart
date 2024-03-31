import 'package:breakdown_assist/Admin/Admin%20user.dart';
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
          final user = snapshot.data?.docs ?? [];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AdminUser(id: user[index].id)));
                  },
                  child: Padding(
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
                          user[index]['path']==''?
                          CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              AssetImage("Assets/profile img.png")
                          ):
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(user[index]['path']),
                            radius: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user[index]['username'],
                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                              Text(user[index]['location'],
                                  style: TextStyle(fontSize: 17)),
                              Text(user[index]['phone number'],
                                  style: TextStyle(fontSize: 17)),
                              Text(user[index]['email id'],
                                  style: TextStyle(fontSize: 17)),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              user[index]['status'] ==1?
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.green.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Accepted",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                              ):user[index]['status']==2?Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Rejected",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                              ):Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Pending",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          Spacer(),

                        ],
                      ),
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
