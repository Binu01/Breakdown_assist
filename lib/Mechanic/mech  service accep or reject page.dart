import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mech_service_AcceptORreject extends StatefulWidget {
  const Mech_service_AcceptORreject({super.key, required this.id});
  final id;

  @override
  State<Mech_service_AcceptORreject> createState() =>
      _Mech_service_AcceptORrejectState();
}

class _Mech_service_AcceptORrejectState
    extends State<Mech_service_AcceptORreject> {
  late DocumentSnapshot detail;

  getdata() async {
    detail = await FirebaseFirestore.instance
        .collection('request')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('request')
          .doc(id)
          .update({'status': 1});
    });
  }

  void reject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('request')
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }
            return Center(
              child: Container(
                height: 550,
                width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade200),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    detail['userprofile'] == ''
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage("Assets/profile img.png"))
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("Assets/profile img.png"),
                          ),
                    Text(
                      detail['username'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Problem",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Place",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Contact number",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detail['service'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  detail['location'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  detail['date'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  detail['time'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  detail['userphn'],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:detail['status']== 0?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade300,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                accept(widget.id);
                              },
                              child: Text(
                                "Accept",
                                style: TextStyle(fontSize: 20),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade300,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                reject(widget.id);
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(fontSize: 20),
                              )
                          )
                        ],
                      ):detail['status']== 1? Padding(
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
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
