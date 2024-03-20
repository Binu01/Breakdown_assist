import 'package:flutter/material.dart';

class Mech_Notification extends StatefulWidget {
  const Mech_Notification({super.key});

  @override
  State<Mech_Notification> createState() => _Mech_NotificationState();
}

class _Mech_NotificationState extends State<Mech_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Notification",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
    body: ListView.separated(
    separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
        itemCount: 2,
        itemBuilder: (BuildContext context,int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
              ),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("Admin Notification",style: TextStyle(fontSize: 20)),
                     SizedBox(
                       width: 40,
                     ),
                     Text("Time",style: TextStyle(fontSize: 15)),
                   ],
                 ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(280, 40, 0, 0),
                    child: Text("Date",style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
          );
        }
        )
    );
  }
}
