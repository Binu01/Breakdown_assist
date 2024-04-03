import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rating_Tab extends StatefulWidget {
  const Rating_Tab({super.key});

  @override
  State<Rating_Tab> createState() => _Rating_TabState();
}

class _Rating_TabState extends State<Rating_Tab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdetail();
  }

  var ID = '';

  void getuserdetail() async {
    final userdetail = await SharedPreferences.getInstance();

    ID = userdetail.getString('id')!;

    setState(() {

    });
  }

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Rating", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("request")
              .where('mechid', isEqualTo: ID).where('final',isEqualTo: 1)
              .get(),
          builder:
              ( context, snapshot) {
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
            final userdetail = snapshot.data?.docs ?? [];
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "The rating given to you",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                            thickness: 5,
                            color: Colors.white,
                          ),
                      itemCount: userdetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  userdetail[index]['userprofile']==''?
                                  CircleAvatar(
                                    radius: 45,
                                    backgroundImage:
                                        AssetImage("Assets/profile img.png"),
                                  ):CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(userdetail[index]['userprofile']),
                                  ),
                                  Text(
                                   userdetail[index]['username'],
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userdetail[index]['service'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(userdetail[index]['date'], style: TextStyle(fontSize: 20)),
                                  Text(userdetail[index]['time'], style: TextStyle(fontSize: 20)),
                                  Text(userdetail[index]['location'], style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Rating"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: userdetail[index]['rating'],
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) => setState(() {

                                    }),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(userdetail[index]['rating'].toString()),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }),
    );
  }
}
