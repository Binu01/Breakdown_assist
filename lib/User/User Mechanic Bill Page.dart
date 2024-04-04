import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'User Payment Page.dart';

class User_Mechanic_Bill_Page extends StatefulWidget {
  const User_Mechanic_Bill_Page({super.key, required this.id});
  final id;

  @override
  State<User_Mechanic_Bill_Page> createState() =>
      _User_Mechanic_Bill_PageState();
}

class _User_Mechanic_Bill_PageState extends State<User_Mechanic_Bill_Page> {
  late DocumentSnapshot detail;

  getdata() async {
    detail = await FirebaseFirestore.instance
        .collection('request')
        .doc(widget.id)
        .get();
  }

  void payment(id) {
    FirebaseFirestore.instance.collection('request').doc(id).update({
      'payment': 5,
      'final':1,
      'rating': rating,
    }).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => User_Payment_page())));
  }

  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        centerTitle: true,
        title: Text(
          "Mechanic Bill",
          style: TextStyle(fontSize: 25),
        ),
      ),
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
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    detail['mechprofile'] == ''
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage("Assets/profile img.png"),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(detail['mechprofile']),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      detail['mechname'],
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      detail['work experience'],
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
                      child: Text(
                        "Available",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Text(
                        "Amount",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          filled: true,
                            fillColor:Colors.lightBlue.shade100 ,
                            prefixIcon: Icon(Icons.currency_rupee),
                            hintText: detail['workamount']),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.lightBlue.shade50,
                                    title: Center(
                                      child: Text("Rating"),
                                    ),
                                    titleTextStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    content: SizedBox(
                                      height: 200,
                                      width: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 35,
                                            minRating: 0.5,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) =>
                                                setState(() {
                                              this.rating = rating;
                                            }),
                                          ),
                                          Text('$rating'),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size(180, 30),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10)),
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white
                                            ),
                                              onPressed: () {
                                                payment(widget.id);
                                              },
                                              child: Text("OK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: Text(
                          "Payment",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
