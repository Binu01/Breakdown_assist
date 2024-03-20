import 'package:flutter/material.dart';

class Mech_service_AcceptORreject extends StatefulWidget {
  const Mech_service_AcceptORreject({super.key});

  @override
  State<Mech_service_AcceptORreject> createState() => _Mech_service_AcceptORrejectState();
}

class _Mech_service_AcceptORrejectState extends State<Mech_service_AcceptORreject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 550,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade200
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("Assets/profile img.png"),
              ),
              Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Problem",style: TextStyle(fontSize: 20),),
                          Text("Place",style: TextStyle(fontSize: 20),),
                          Text("Date",style: TextStyle(fontSize: 20),),
                          Text("Time",style: TextStyle(fontSize: 20),),
                          Text("Contact number",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(": Problem",style: TextStyle(fontSize: 20),),
                          Text(": Place",style: TextStyle(fontSize: 20),),
                          Text(": Date",style: TextStyle(fontSize: 20),),
                          Text(": Time",style: TextStyle(fontSize: 20),),
                          Text(": 0000000000",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Problem",style: TextStyle(fontSize: 20),),
              //     Text(": Fuel Leaking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Place",style: TextStyle(fontSize: 20),),
              //     Text(": Kozhikode",style: TextStyle(fontSize: 20),),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Date",style: TextStyle(fontSize: 20),),
              //     Text(": Date",style: TextStyle(fontSize: 20),),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Time",style: TextStyle(fontSize: 20),),
              //
              //     Text(": Time",style: TextStyle(fontSize: 20),),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Contact Number",style: TextStyle(fontSize: 20),),
              //     Text(": 0000000000",style: TextStyle(fontSize: 20),),
              //   ],
              // ),
              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade300,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                  onPressed: (){},
                      child: Text("Accept",style: TextStyle(fontSize: 20),)),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade300,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){},
                      child: Text("Reject",style: TextStyle(fontSize: 20),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
