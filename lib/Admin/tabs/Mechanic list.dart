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
                          mech[index]['path']==''?
                          CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              AssetImage("Assets/profile img.png")
                          ):
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(mech[index]['path']),
                            radius: 40,
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
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mech[index]['status'] ==1?
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
                              ):mech[index]['status']==2?Container(
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
                              ),
                            ],
                          ),
                          Spacer(),
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
