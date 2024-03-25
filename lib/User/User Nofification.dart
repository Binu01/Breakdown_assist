import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User_Notification extends StatefulWidget {
  const User_Notification({super.key});

  @override
  State<User_Notification> createState() => _User_NotificationState();
}

class _User_NotificationState extends State<User_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title:  Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('notifications').get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
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
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 5,
                  color: Colors.white,
                ),
                itemCount: notification.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(notification[index]['matter'],
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(notification[index]['time']),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(notification[index]['content'],
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(notification[index]['date']),
                                  )
                                ],
                              )
                            ]
                        ),
                      )
                  );
                });

    },
        )
    );
  }
}
