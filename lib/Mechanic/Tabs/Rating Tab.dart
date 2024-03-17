import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating_Tab extends StatefulWidget {
  const Rating_Tab({super.key});

  @override
  State<Rating_Tab> createState() => _Rating_TabState();
}

class _Rating_TabState extends State<Rating_Tab> {

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.blue.shade200,
        title: Text("Rating",style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("The rating given to you",style: TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("Assets/profile img.png"),
                      ),
                      Text("Name",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                 Spacer(),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Engine work",style: TextStyle(fontSize: 20),),
                     Text("Date",style: TextStyle(fontSize: 20)),
                     Text("Time",style: TextStyle(fontSize: 20)),
                     Text("Place",style: TextStyle(fontSize: 20)),
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
                  minRating: 0.5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating)=>
                    setState(() {
                   this.rating = rating;
                    }
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('$rating'),

                ],
              ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
