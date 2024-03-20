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

class _HomeTabState extends State<HomeTab>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.blue.shade200,
          body:Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular( 10),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade400
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    // overlayColor: MaterialStateColor.transparent,
                      tabs: [
                        Tab(child: Text("User",style: TextStyle(fontSize: 20,color: Colors.black),),),
                        Tab(child: Text("Mechanic",style: TextStyle(fontSize: 20,color: Colors.black)),),
                      ]
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: TabBarView(

                    children: [
                  Userlist(),
                  MechanicList(),
                ]),
              ),
            ],
          ),

      ),
    );
  }
}




