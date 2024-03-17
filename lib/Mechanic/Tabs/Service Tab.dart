import 'package:flutter/material.dart';

class Service_Tab extends StatefulWidget {
  const Service_Tab({super.key});

  @override
  State<Service_Tab> createState() => _Service_TabState();
}

class _Service_TabState extends State<Service_Tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){

          showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
            backgroundColor: Colors.blue.shade200,
            title: Center(
              child: Text("Add service"),
            ),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
            content: Container(
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue.shade200
                            )
                        )
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){},
                      child: Text("Add",style: TextStyle(fontSize: 20),))
                ],
              ),
            ),
          )
          );

        },
      child: Icon(
          size: 50,
          Icons.add),),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Services",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: 330,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ListView.separated(
                  separatorBuilder: (context,index)=> Divider(thickness: 1,color: Colors.black,),
                itemCount: 3,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                        title: Text("Tyre puncture",style: TextStyle(fontSize: 20),),
                        trailing: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.delete),
                          iconSize: 30,
                        ),
                      );
                  }
                  ),
            ),
          ],
        ),
      ),
    );
  }
}




