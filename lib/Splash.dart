import 'package:breakdown_assist/user%20or%20mech%20page.dart';
import 'package:flutter/material.dart';

class Splashscrn extends StatefulWidget {
  const Splashscrn({super.key});

  @override
  State<Splashscrn> createState() => _SplashscrnState();
}

class _SplashscrnState extends State<Splashscrn> {
  @override
  void initState() {
     //TODO: implement initState
    super.initState();
    Tohome();
  }
Tohome()async{
  await Future.delayed( Duration(seconds: 3),(){});
Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=> UserOrMech())
);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 330,
          child: Image.asset("Assets/splash img 1.jpg"),
        ),
      ),
    );
  }
}
