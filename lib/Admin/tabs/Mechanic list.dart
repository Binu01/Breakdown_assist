import 'package:flutter/material.dart';

class MechanicList extends StatefulWidget {
  const MechanicList({super.key});

  @override
  State<MechanicList> createState() => _MechanicListState();
}

class _MechanicListState extends State<MechanicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: ListView.separated(
          separatorBuilder: (context,index)=> Divider(color: Colors.blue.shade200),
          itemCount: 3,
          itemBuilder: (BuildContext context,int index){
            return  Container(
              color: Colors.white,
              height: 100,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("Assets/profile img.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Text("Mobile number",style: TextStyle(fontSize: 17)),
                      Text("Service",style: TextStyle(fontSize: 17)),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
