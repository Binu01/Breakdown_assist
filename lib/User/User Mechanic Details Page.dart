import 'package:flutter/material.dart';

class User_Mech_Detail_pg extends StatefulWidget {
  const User_Mech_Detail_pg({super.key});

  @override
  State<User_Mech_Detail_pg> createState() => _User_Mech_Detail_pgState();
}

class _User_Mech_Detail_pgState extends State<User_Mech_Detail_pg> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Needed Service"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              Text("Name",style: TextStyle(fontSize: 25),),
              SizedBox(
                height: 10,
              ),
              Text("Contact Number",style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 5,
              ),
              Text("+2 Year Experience",style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                  color: Colors.green.shade400,
                ),
                child: Text("Available",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                child: Text("Add Needed Service",style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                   decoration: BoxDecoration(
                     color: Colors.blue.shade200,
                     borderRadius: BorderRadius.circular(10)
                   ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        iconSize: 35,
                        style: TextStyle(fontSize: 20,color: Colors.black),
                          value: select,
                          items:[
                            DropdownMenuItem(child: Text("Fuel Leacking"),
                            value: 0,
                            ),
                            DropdownMenuItem(child: Text("Service"),
                            value: 1,
                            ),
                            DropdownMenuItem(child: Text("Fuel Leacking"),
                            value: 2,
                            ),
                      ] ,
                          onChanged: (value){
                        setState(() {
                           select = value!;
                        }
                        );
                          }
                          ),
                    ),
                  ),

                  IconButton(onPressed: (){},
                      icon: Icon(
                          size: 35,
                          Icons.add_circle_rounded))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                child: Text("Place",style: TextStyle(fontSize: 20),),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Place"
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(180, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                  ),
                  onPressed: (){},
                  child: Text("Request",style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
