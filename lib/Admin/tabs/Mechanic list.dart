import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:breakdown_assist/Admin/Admin%20Mechanic.dart';

class MechanicList extends StatefulWidget {
  const MechanicList({super.key});

  @override
  State<MechanicList> createState() => _MechanicListState();
}

class _MechanicListState extends State<MechanicList> {
  int currentPage = 0;
  int itemsPerPage = 5;
  late QuerySnapshot? mechanicSnapshot;

  Future<void> getData() async {
    mechanicSnapshot = await FirebaseFirestore.instance.collection('mechanics').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          final mechanics = mechanicSnapshot?.docs ?? [];
          final totalItems = mechanics.length;
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
                    final mechanicData = mechanics[dataIndex];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminMechanic(id: mechanicData.id),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          color: Colors.lightBlue.shade50,
                          height: 100,
                          width: 100,
                          child: Row(
                            children: [
                              Spacer(),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    mechanicData['path'].isEmpty
                                        ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage("Assets/profile img.png"),
                                    )
                                        : CircleAvatar(
                                      backgroundImage: NetworkImage(mechanicData['path']),
                                      radius: 40,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mechanicData['username'],
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      mechanicData['phone number'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      mechanicData['work experience'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    mechanicData['status'] == 1
                                        ? Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade400,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                            "Accepted",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechanicData['status'] == 2
                                        ? Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                            "Rejected",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                        : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                            "Pending",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
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
