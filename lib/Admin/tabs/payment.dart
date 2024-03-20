import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.blue.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5
        ),
        child: ListView.builder(
          itemCount: 5,
            itemBuilder: (context,index){
            return Card(
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 15, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(fontSize: 20),),
                        Text("date",style: TextStyle(fontSize: 20)),],
                    ),
                    Text("amount",style: TextStyle(fontSize: 20)),
                    Text("service",style: TextStyle(fontSize: 20)),
                    Text("Mechanic name",style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 90,
                    ),

                  ],
                ),
              ) ,
            );
        }
        ),
      ),
    );
  }
}
