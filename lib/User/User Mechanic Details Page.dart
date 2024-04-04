import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Mech_Detail_pg extends StatefulWidget {
  const User_Mech_Detail_pg({super.key, required this.id});
  final id;
  @override
  State<User_Mech_Detail_pg> createState() => _User_Mech_Detail_pgState();
}

class _User_Mech_Detail_pgState extends State<User_Mech_Detail_pg> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmechdetails();
  }

  var ID = '';

  void getmechdetails() async {
    final mechdetail = await SharedPreferences.getInstance();

    ID = mechdetail.getString('id')!;

    setState(() {});
  }

  final date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final _key = GlobalKey<FormState>();

  String? dropdownvalue;

  // var items = [
  //   '-select service-',
  //   'engine service',
  //   'fuel',
  //   'puncture',
  //   'ac repair',
  //   'chain sporke',
  // ];

  DocumentSnapshot? mech;
  getdata() async {
    mech = await FirebaseFirestore.instance
        .collection('mechanics')
        .doc(widget.id)
        .get();
    getuser();
    print("get mech");
  }

  DocumentSnapshot? user;
  getuser() async {
    user = await FirebaseFirestore.instance
        .collection('UserDetails')
        .doc(ID)
        .get();
    print("get user");
  }

  var placectrl = TextEditingController();

  Future<dynamic> mechrequest() async {
    print("object");
    await FirebaseFirestore.instance.collection('request').add({
      'service': dropdownvalue,
      'status': 0,
      'payment': 0,
      'userprofile': user!['path'],
      "mechprofile": mech!["path"],
      "username": user!['username'],
      'mechname': mech!['username'],
      'time': time.format(context),
      'date': DateFormat('dd/MM/yyyy').format(date),
      'location': placectrl.text,
      'mechid': widget.id,
      'userid': ID,
      'userphn': user!['phone number'],
      'work experience': mech!['work experience']
    });
    print("done");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        title: Text("Needed Service"),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
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
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("Assets/profile img.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        mech!['username'],
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(mech!['phone number'],
                          style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        mech!['work experience'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          color: Colors.green.shade400,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Available",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 130, 0),
                        child: Text("Add Needed Service",
                            style: TextStyle(fontSize: 20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('services')
                                .where('mechid', isEqualTo: widget.id)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                List<String> tradeList = snapshot.data!.docs
                                    .map((DocumentSnapshot document) =>
                                        document['service'].toString())
                                    .toList();

                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black54),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: DropdownButton<String>(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 3),
                                        underline: const SizedBox(),
                                        borderRadius: BorderRadius.circular(10),
                                        hint: const Text(
                                            "choose your needed service"),
                                        value: dropdownvalue,
                                        // Set initial value if needed
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                            print(dropdownvalue);
                                          });
                                        },

                                        items: tradeList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) =>
                                                    DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
                        child: Text(
                          "Place",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required';
                              }
                              return null;
                            },
                            controller: placectrl,
                            style: TextStyle(fontSize: 20),
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Place"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(180, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              mechrequest();
                            }
                          },
                          child: Text(
                            "Request",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
