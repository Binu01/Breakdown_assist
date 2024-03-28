import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mech_Accept_Tab extends StatefulWidget {
  const Mech_Accept_Tab({super.key});

  @override
  State<Mech_Accept_Tab> createState() => _Mech_Accept_TabState();
}

class _Mech_Accept_TabState extends State<Mech_Accept_Tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("request").get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            final detail = snapshot.data?.docs ?? [];
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      thickness: 5,
                      color: Colors.white,
                    ),
                itemCount: detail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Card(
                      color: Colors.lightBlue.shade50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                   NetworkImage(detail[index]['userprofile']),
                                radius: 40,
                              ),
                              Text(detail[index]["username"], style: TextStyle(fontSize: 20))
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                detail[index]['service'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(detail[index]['date'], style: TextStyle(fontSize: 20)),
                              Text(detail[index]['time'], style: TextStyle(fontSize: 20)),
                              Text(detail[index]['location'], style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                color: Colors.red),
                            child: Text(
                              "Payment pending",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
