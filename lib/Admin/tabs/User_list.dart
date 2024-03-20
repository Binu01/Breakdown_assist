import 'package:flutter/material.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: ListView.separated(
            separatorBuilder: (context,index)=> Divider(color: Colors.blue.shade200),
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                color: Colors.white,
                height: 100,
                width: 200,
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
                        Text("Location",style: TextStyle(fontSize: 17)),
                        Text("Mobile number",style: TextStyle(fontSize: 17)),
                        Text("Email",style: TextStyle(fontSize: 17)),
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
