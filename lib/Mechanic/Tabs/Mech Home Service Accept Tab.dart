import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Mech Status.dart';
import '../mech  service accep or reject page.dart';

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
          future: FirebaseFirestore.instance
              .collection("request")
              .where('status', isEqualTo: 1)
              .get(),
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: InkWell(
                      onTap: () {
                        detail[index]['payment'] == 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mech_Status(
                                          id: detail[index].id,
                                        )))
                            : null;
                      },
                      child: Card(
                        color: Colors.lightBlue.shade50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                detail[index]['userprofile'] == ''
                                    ? CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                            "Assets/profile img.png"))
                                    : CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            detail[index]['userprofile']),
                                        radius: 35,
                                      ),
                                Text(detail[index]["username"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detail[index]['service'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(detail[index]['date'],
                                    style: TextStyle(fontSize: 20)),
                                Text(detail[index]['time'],
                                    style: TextStyle(fontSize: 20)),
                                Text(detail[index]['location'],
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                detail[index]['payment'] == 0
                                    ? Container(
                                  height: 30,
                                  width: 133,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.orange),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.orange),
                                        child: Center(
                                          child: Text(
                                            "Work in progress",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    : detail[index]['payment'] == 3
                                        ? Container(
                                  height: 30,
                                  width: 133,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red),
                                            child: Center(
                                              child: Text(
                                                "Payment pending",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          )
                                        : detail[index]['payment'] == 4
                                            ? Container(
                                  height: 30,
                                  width: 133,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.red),
                                                child: Center(
                                                  child: Text(
                                                    "Failed",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : detail[index]['payment'] == 5
                                                ? Container(
                                  height: 30,
                                  width: 133,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.green),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.green),
                                                    child: Center(
                                                      child: Text(
                                                        "Payment successful",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : detail[index]['payment'] == 6
                                                    ? Container(
                                  height: 30,
                                  width: 133,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .grey.shade400),
                                                        child: Center(
                                                          child: Text(
                                                            "Completed",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                  height: 30,
                                  width: 133,
                                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
