import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mech_Notification extends StatefulWidget {
  const Mech_Notification({super.key});

  @override
  State<Mech_Notification> createState() => _Mech_NotificationState();
}

class _Mech_NotificationState extends State<Mech_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade100,
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future:
                FirebaseFirestore.instance.collection('notifications').get(),
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
              final notification = snapshot.data?.docs ?? [];
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                        ),
                    itemCount: notification.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(notification[index]['matter'],
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(notification[index]['time']),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 280,
                                child: Text(notification[index]['content'],
                                    style: TextStyle(fontSize: 20)),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(notification[index]['date']),
                              )
                            ],
                          )
                        ]),
                      );
                    }),
              );
            }));
  }
}
