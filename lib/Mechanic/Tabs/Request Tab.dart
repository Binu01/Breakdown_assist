import 'package:breakdown_assist/Mechanic/Tabs/Mech%20Home%20Service%20Accept%20Tab.dart';
import 'package:breakdown_assist/Mechanic/Tabs/Mech%20Home%20Service%20Request%20Tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
          leading: CircleAvatar(
            backgroundImage: AssetImage("Assets/profile img.png"),
          ),
          actions: [
            IconButton(
                color: Colors.yellow.shade700,
                onPressed: (){},
                icon: Icon(CupertinoIcons.bell_fill))
          ],
          bottom: TabBar(tabs: [
            Tab(
              child: Text("Requests"),
            ),
            Tab(
              child: Text("Accepted"),
            )
          ]
          ),
        ),
        body: TabBarView(children: [
          Mech_Req_Tab(),
          Mech_Accept_Tab(),

        ]),
      ),
    );
  }
}
