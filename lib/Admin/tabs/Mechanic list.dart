import 'package:breakdown_assist/Admin/Admin%20Mechanic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MechanicList extends StatefulWidget {
  const MechanicList({super.key});

  @override
  State<MechanicList> createState() => _MechanicListState();
}

class _MechanicListState extends State<MechanicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('mechanics').get(),
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
          final mech = snapshot.data?.docs ?? [];
          return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.blue.shade200),
                itemCount: mech.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminMechanic(id: mech[index].id)));
                    },
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      width: 100,
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
                                mech[index]['username'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(mech[index]['phone number'],
                                  style: TextStyle(fontSize: 17)),
                              Text(mech[index]['work experience'],
                                  style: TextStyle(fontSize: 17)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
