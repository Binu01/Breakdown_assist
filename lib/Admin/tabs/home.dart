import 'package:breakdown_assist/Admin/tabs/Mechanic%20list.dart';
import 'package:breakdown_assist/Admin/tabs/User_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,initialIndex: 0,
      child: Scaffold(
        body:Column(
          children: [
            TabBar(tabs: [
              Tab(child: Text("User",style: TextStyle(fontSize: 20),),),
              Tab(child: Text("Mechanic",style: TextStyle(fontSize: 20)),),
            ]
            ),
            Expanded(
              child: TabBarView(children: [
                Userlist(),
                MechanicList(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
