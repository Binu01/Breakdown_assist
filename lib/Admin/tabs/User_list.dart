import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:breakdown_assist/Admin/Admin%20user.dart';

class Userlist extends StatefulWidget {
  const Userlist({Key? key}) : super(key: key);

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  int currentPage = 0;
  int itemsPerPage = 5;
  late QuerySnapshot? userSnapshot;

  Future<void> getData() async {
    userSnapshot = await FirebaseFirestore.instance.collection("UserDetails").get();
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

          final user = userSnapshot?.docs ?? [];
          final totalItems = user.length;
          final totalPages = (totalItems / itemsPerPage).ceil();

          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: (currentPage == totalPages - 1)
                      ? totalItems - (currentPage * itemsPerPage)
                      : itemsPerPage,
                  itemBuilder: (context, index) {
                    final dataIndex = (currentPage * itemsPerPage) + index;
                    if (dataIndex >= totalItems) {
                      return SizedBox(); // Return an empty SizedBox if no more data
                    }
                    final userData = user[dataIndex];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminUser(id: userData.id),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: Container(
                          color: Colors.lightBlue.shade50,
                          width: 330,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  children: [userData['path'].isEmpty
                                      ? CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage("Assets/profile img.png"),
                                  )
                                      : CircleAvatar(
                                    backgroundImage: NetworkImage(userData['path']),
                                    radius: 40,
                                  ),],
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData['username'],
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      userData['location'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      userData['phone number'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      userData['email id'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    userData['status'] == 1
                                        ? Container(
                                      height: 30,
                                      width: 80,
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
                                        : userData['status'] == 2
                                        ? Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                            "Rejected",
                                            style:
                                            TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                        : Container(
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Text(
                                            "Pending",
                                            style:
                                            TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
