import 'package:breakdown_assist/User/User%20Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Mech_failed_page extends StatefulWidget {
  const Mech_failed_page({super.key, required this.id});
  final id;

  @override
  State<Mech_failed_page> createState() => _Mech_failed_pageState();
}

class _Mech_failed_pageState extends State<Mech_failed_page> {


  late DocumentSnapshot detail;
  getdata() async {
    detail = await FirebaseFirestore.instance
        .collection('request')
        .doc(widget.id)
        .get();
  }

  void failed(id) {
    FirebaseFirestore.instance.collection('request').doc(id).update({
      'payment':6,
      'final':1,
      'rating': rating,
    }).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => User_Home())));
  }

  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          "Failed Project",
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
                    ),detail['mechprofile']==''?
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("Assets/profile img.png"),
                    ):CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('mechprofile'),
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

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Text(
                        "Failed Reason",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextFormField(
                          readOnly: true,
                          maxLines: 5,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              hintText: detail['workfaildreason'],
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.blue.shade200,
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
                                          SizedBox(
                                            height: 50,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(180, 30),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  backgroundColor: Colors.blue,
                                                  foregroundColor:
                                                      Colors.white),
                                              onPressed: () {
                                                failed(widget.id);
                                              },
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: Text(
                          "OK",
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
