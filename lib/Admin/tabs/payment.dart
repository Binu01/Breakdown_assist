import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({super.key});

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('request').where('payment', isEqualTo: 5).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error:${snapshot.error}"),
                  );
                }
                final details = snapshot.data?.docs ?? [];
                return ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.lightBlue.shade50,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 5, 15, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    details[index]['username'],
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  Text(details[index]['date'], style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Text(details[index]['workamount'], style: TextStyle(fontSize: 20)),
                              Text(details[index]['service'], style: TextStyle(fontSize: 20)),
                              Text(details[index]['mechname'],
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(
                                width: 90,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
