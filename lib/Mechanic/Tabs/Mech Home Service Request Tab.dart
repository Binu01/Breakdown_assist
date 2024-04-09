import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mech  service accep or reject page.dart';

class Mech_Req_Tab extends StatefulWidget {
  const Mech_Req_Tab({Key? key});

  @override
  State<Mech_Req_Tab> createState() => _Mech_Req_TabState();
}

class _Mech_Req_TabState extends State<Mech_Req_Tab> {
  late String ID = '';
  int currentPage = 0;
  int itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    final mechDetail = await SharedPreferences.getInstance();
    setState(() {
      ID = mechDetail.getString('id')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ID.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("request")
            .where('mechid', isEqualTo: ID)
            .get(),
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
          final detail = snapshot.data?.docs ?? [];
          final totalItems = detail.length;
          final totalPages = (totalItems / itemsPerPage).ceil();

          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: (currentPage == totalPages - 1)
                      ? totalItems - (currentPage * itemsPerPage)
                      : itemsPerPage,
                  itemBuilder: (BuildContext context, int index) {
                    final dataIndex = (currentPage * itemsPerPage) + index;
                    if (dataIndex >= totalItems) {
                      return SizedBox();
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mech_service_AcceptORreject(
                                id: detail[dataIndex].id),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  SizedBox(height: 5),
                                  detail[dataIndex]['userprofile'] == ''
                                      ? CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                              "Assets/profile img.png"),
                                        )
                                      : CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              detail[dataIndex]['userprofile']),
                                          radius: 35,
                                        ),
                                  Text(detail[dataIndex]['username'],
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              SizedBox(width: 70),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    detail[dataIndex]['service'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(detail[dataIndex]['date'],
                                      style: TextStyle(fontSize: 20)),
                                  Text(detail[dataIndex]['time'],
                                      style: TextStyle(fontSize: 20)),
                                  Text(detail[dataIndex]['location'],
                                      style: TextStyle(fontSize: 20)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              NumberPaginator(
                numberPages: totalPages,
                initialPage: currentPage,
                onPageChange: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
