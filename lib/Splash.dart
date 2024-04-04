import 'package:breakdown_assist/user%20or%20mech%20page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 330,
          child: Lottie.asset("Assets/Animation - 1712228504251.json"),
        ),
      ),
    );
  }
}
