import 'package:flutter/material.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        backgroundColor: Colors.white,
        onPressed: (){},
          child: Icon(
              size: 50,
              Icons.add),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 5
          ),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Heading",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("Content",style: TextStyle(fontSize: 20),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
    );
  }
}
