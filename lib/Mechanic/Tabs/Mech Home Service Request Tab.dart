import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mech  service accep or reject page.dart';

class Mech_Req_Tab extends StatefulWidget {
  const Mech_Req_Tab({super.key});

  @override
  State<Mech_Req_Tab> createState() => _Mech_Req_TabState();
}

class _Mech_Req_TabState extends State<Mech_Req_Tab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails();
  }

  var ID = '';

  void getdetails() async {
    final mechdetail = await SharedPreferences.getInstance();

    ID = mechdetail.getString('id')!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("request").where('mechid',isEqualTo: ID).get(),
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: InkWell(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Mech_service_AcceptORreject(id: detail[index].id,)));
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
                                  height: 5,
                                ),detail[index]['userprofile']==''?
                                CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                    AssetImage("Assets/profile img.png")
                                ):
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(detail[index]['userprofile']),
                                  radius: 40,
                                ),
                                Text(detail[index]['username'], style: TextStyle(fontSize: 20))
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  detail[index]['service'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(detail[index]['date'], style: TextStyle(fontSize: 20)),
                                Text(detail[index]['time'], style: TextStyle(fontSize: 20)),
                                Text(detail[index]['location'], style: TextStyle(fontSize: 20)),
                              ],
                            )
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
