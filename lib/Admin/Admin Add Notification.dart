import 'package:flutter/material.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body:SingleChildScrollView(
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
                onPressed: (){},
                child: Text("Submit",style: TextStyle(fontSize: 20),))

          ],
        ),
      ) ,
    );
  }
}
