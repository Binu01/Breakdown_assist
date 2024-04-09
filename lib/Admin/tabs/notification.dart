import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Admin Add Notification.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNotification()));
        },
          child:  Icon(
              size: 50,
              Icons.add),
      ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('notifications').get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return  Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            }
            final notification = snapshot.data?.docs??[];
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white,
                  ),
                  itemCount: notification.length,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(notification[index]['matter'],style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                            ),
                          ),
                           SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(notification[index]['content'],style:  TextStyle(fontSize: 20),),
                          ),
                           SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }
              ),
            );
          },

        ),
    );
  }
}
