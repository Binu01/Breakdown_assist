import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mech_Status extends StatefulWidget {
  const Mech_Status({super.key, required this.id});
  final id;

  @override
  State<Mech_Status> createState() => _Mech_StatusState();
}

class _Mech_StatusState extends State<Mech_Status> {
  TextEditingController amountctrl = TextEditingController();
  TextEditingController rejectctrl = TextEditingController();

  late DocumentSnapshot detail;

  getdata() async {
    detail = await FirebaseFirestore.instance
        .collection('request')
        .doc(widget.id)
        .get();
  }

  void payment(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('request')
          .doc(id)
          .update({'payment': "3", "workamount": amountctrl.text}).then(
              (value) => Navigator.pop(context));
    });
  }

  void paymentreject(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('request')
          .doc(id)
          .update({'payment': "4", "workfaildreason": rejectctrl.text}).then(
              (value) => Navigator.pop(context));
    });
  }

  final _Key = GlobalKey<FormState>();

  String _value = '';
  var a, b, c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _Key,
          child: FutureBuilder(
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
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 150,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade200,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  detail['userprofile'] == ''
                                      ? CircleAvatar(
                                          radius: 40,
                                          backgroundImage: AssetImage(
                                              "Assets/profile img.png"))
                                      : CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              detail['userprofile']),
                                        ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    detail['username'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    detail['service'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    detail['date'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    detail['time'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    detail['location'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                          child: Text(
                            "Add status",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              child: Column(children: [
                                RadioListTile(
                                    activeColor: Colors.blue,
                                    title: Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    value: "b",
                                    groupValue: _value,
                                    onChanged: (value) {
                                      if (value == "b") {
                                        a = 1;
                                      }
                                      setState(() {
                                        print(value);
                                        _value = value.toString();
                                      });
                                    }),
                                RadioListTile(
                                    activeColor: Colors.blue,
                                    title: Text("Not completed",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900)),
                                    value: "c",
                                    groupValue: _value,
                                    onChanged: (value) {
                                      print(value);
                                      if (value == "c") {
                                        a = 2;
                                      }
                                      _value = value.toString();
                                      setState(() {});
                                    }),
                              ]),
                            ),
                          ],
                        ),
                        a == 1
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 225, 0),
                                    child: Text("Amount",
                                        style: TextStyle(fontSize: 25)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 90),
                                    child: TextFormField(
                                      controller: amountctrl,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '*Required';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          prefixIcon:
                                              Icon(Icons.currency_rupee)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(170, 30),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        if (_Key.currentState!.validate()) {
                                          payment(widget.id);
                                        }
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(fontSize: 20),
                                      ))
                                ],
                              )
                            : a == 2
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 175, 0),
                                        child: Text("Reject reason",
                                            style: TextStyle(fontSize: 25)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 150,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          controller: rejectctrl,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '*Required';
                                            }
                                            return null;
                                          },
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: Size(170, 30),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {
                                            if (_Key.currentState!.validate()) {
                                              paymentreject(widget.id);
                                            }
                                          },
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(fontSize: 20),
                                          ))
                                    ],
                                  )
                                : Text('choose an option')
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
