import 'package:flutter/material.dart';

class User_Mechanic_List extends StatefulWidget {
  const User_Mechanic_List({super.key});

  @override
  State<User_Mechanic_List> createState() => _User_Mechanic_ListState();
}

class _User_Mechanic_ListState extends State<User_Mechanic_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ListView.separated(
          separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
          itemCount: 2,
          itemBuilder:  (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage("Assets/profile img.png"),
                          radius: 40,
                        ),
                        Text("Name",style: TextStyle(fontSize: 20))
                      ],
                    ),
                   Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("+1 Year Experience",style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Fuel Leacking",style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                              child: Text("Available",style: TextStyle(fontSize: 20,color: Colors.white),)),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

