import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Mechanic_Request_List extends StatefulWidget {
  const User_Mechanic_Request_List({super.key});

  @override
  State<User_Mechanic_Request_List> createState() =>
      _User_Mechanic_Request_ListState();
}

class _User_Mechanic_Request_ListState
    extends State<User_Mechanic_Request_List> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmechdetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("request").where('userid', isEqualTo: ID).get(),
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
          final mechdetail = snapshot.data?.docs ?? [];
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      thickness: 5,
                      color: Colors.white,
                    ),
                itemCount: mechdetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Card(
                      color: Colors.lightBlue.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mechdetail[index]['mechname'], style: TextStyle(fontSize: 20)),
                              Text(mechdetail[index]['date'], style: TextStyle(fontSize: 20)),
                              Text(mechdetail[index]['time'], style: TextStyle(fontSize: 20)),
                              Text(
                                mechdetail[index]['service'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Text(
                              "Approved",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
  var ID = '';

  void getmechdetails() async {
    final mechdetail = await SharedPreferences.getInstance();

    ID = mechdetail.getString('id')!;

    setState(() {});
  }
  void showdetail() async {
    await FirebaseFirestore.instance
        .collection('UserDetails')
        .where('mechid', isEqualTo: ID)
        .get();
  }
}
