import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({super.key, required this.id});

  final id;

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  late DocumentSnapshot user;

  getdata() async {
    user = await FirebaseFirestore.instance
        .collection('UserDetails')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('UserDetails')
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('UserDetails')
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade200,
        body: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error${snapshot.error}");
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Container(
                    height: 700,
                    width: 340,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("Assets/profile img.png"),
                              ),
                              Text(
                                "Name",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Location",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "Username",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: user['username']),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: user['phone number']),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "Email Address",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: user['email id']),
                          ),
                        ), Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:user['status']== 0?Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 190,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      backgroundColor: Colors.green.shade300,
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    accept(widget.id);
                                  },
                                  child: Text("Accept",
                                      style: TextStyle(fontSize: 20))),
                              SizedBox(
                                width: 75,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      backgroundColor: Colors.red.shade300,
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    reject(widget.id);
                                  },
                                  child: Text(
                                    "Reject",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ):user['status'] ==1? Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Container(
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                                color: Colors.green.shade300
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Accepted",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ): Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red.shade300
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Rejected",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
