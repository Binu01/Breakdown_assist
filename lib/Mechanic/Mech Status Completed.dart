import 'package:flutter/material.dart';

class Mech_status_completed extends StatefulWidget {
  const Mech_status_completed({super.key});

  @override
  State<Mech_status_completed> createState() => _Mech_status_completedState();
}

class _Mech_status_completedState extends State<Mech_status_completed> {

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
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
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:AssetImage("Assets/profile img.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Name",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Fuel Leaking",style: TextStyle(fontSize: 17),),
                        Text("Date",style: TextStyle(fontSize: 17),),
                        Text("Time",style: TextStyle(fontSize: 17),),
                        Text("Place",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                child: Text("Add status",style: TextStyle(fontSize: 25),),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = value!;
                        });
        
                      }
                      ),
                  Text("Completed",style: TextStyle(fontSize: 20),),
        
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value = value!;
                            });
        
                          }
                      ),
                      Text("Not Completed",style: TextStyle(fontSize: 20)),
                ],
              )
            ],
          ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                child: Text("Amount",style: TextStyle(fontSize: 25)),
              ),
             SizedBox(
               height:20 ,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(
                 horizontal: 90
               ),
               child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10)
                   ),
                   prefixIcon: Icon(Icons.currency_rupee)
                 ),
               ),
             ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    fixedSize: Size(170,30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: (){},
                  child: Text("Submit",style: TextStyle(fontSize: 20),))
            ],
        ),
        ),
      )
    );
  }
}
