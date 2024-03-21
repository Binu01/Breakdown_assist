import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {

  var matterctrl = TextEditingController();
  var contentctrl = TextEditingController();
  final _key = GlobalKey<FormState>();
  final Snack = SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Notification Send"));

  Future<dynamic> SubmitNotification ()async{
    await FirebaseFirestore.instance.collection('notifications').add({
      'matter' : matterctrl.text,
      'content': contentctrl.text,
    }).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body:SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "Enter Matter",style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: matterctrl,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },

                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 18),
                    hintText: "Matter",
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                        selectionColor: Colors.white,
                        "Enter content",style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(color: Colors.white)
                ),
                height: 380,
                width: 310,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextFormField(

                    controller: contentctrl,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },

                    style: TextStyle(fontSize: 20),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 18),
                        hintText: "content...",
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: (){

                    if (_key.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(Snack);
                      SubmitNotification();
                    }

                  },
                  child: Text("Submit",style: TextStyle(fontSize: 20),))

            ],
          ),
        ),
      ) ,
    );
  }
}
