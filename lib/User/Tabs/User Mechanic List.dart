import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../User Mechanic Details Page.dart';

class User_Mechanic_List extends StatefulWidget {
  const User_Mechanic_List({Key? key, required this.selectedLocation})
      : super(key: key);

  final String? selectedLocation;

  @override
  State<User_Mechanic_List> createState() => _User_Mechanic_ListState();
}

class _User_Mechanic_ListState extends State<User_Mechanic_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('mechanics')
            .where('status', isEqualTo: 1)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          List<DocumentSnapshot> filteredMechanics = [];
          if (widget.selectedLocation != null) {
            // Filter mechanics by selected location
            filteredMechanics = mech
                .where((doc) => doc['location'] == widget.selectedLocation)
                .toList();
          } else {
            // Show all mechanics if no location selected
            filteredMechanics = [...mech];
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 5,
              color: Colors.white,
            ),
            itemCount: filteredMechanics.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => User_Mech_Detail_pg(
                          id: filteredMechanics[index].id,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.lightBlue.shade50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            filteredMechanics[index]['path'] == ''
                                ? CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage("Assets/profile img.png"),
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        filteredMechanics[index]['path']),
                                    radius: 40,
                                  ),
                            Text(filteredMechanics[index]['username'],
                                style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredMechanics[index]['work experience'],
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(filteredMechanics[index]['location'],
                                style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Available",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
