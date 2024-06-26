import 'package:breakdown_assist/Mechanic/Mech%20Notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Mech Edit Profile.dart';
import 'Mech Home Service Accept Tab.dart';
import 'Mech Home Service Request Tab.dart';

class Request_Tab extends StatefulWidget {
  const Request_Tab({super.key});

  @override
  State<Request_Tab> createState() => _Request_TabState();
}

class _Request_TabState extends State<Request_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightBlue.shade100,
            leading: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Mech_Edit_Profile()));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("Assets/profile img.png"),
                ),
              ),
            ),
            actions: [
              IconButton(
                  color: Colors.amber,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mech_Notification()));
                  },
                  icon: Icon(CupertinoIcons.bell_fill))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Colors.lightBlue.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent.shade100),
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      // overlayColor: MaterialStateColor.transparent,
                      tabs: [
                        Tab(
                          child: Text(
                            "Request",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Tab(
                          child: Text("Accepted",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(children: [
                  Mech_Req_Tab(),
                  Mech_Accept_Tab(),
                ]),
              ),
            ],
          ),
        ));
  }
}
