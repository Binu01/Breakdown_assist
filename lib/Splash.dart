import 'package:breakdown_assist/user%20or%20mech%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscrn extends StatefulWidget {
  const Splashscrn({super.key});

  @override
  State<Splashscrn> createState() => _SplashscrnState();
}

class _SplashscrnState extends State<Splashscrn> {
  void initState() {
     //TODO: implement initState
    super.initState();
    Tohome();
  }
Tohome()async{
  await Future.delayed(Duration(seconds: 3),(){});
Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=>UserOrMech())
);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey2,
      body: Center(
        child: Container(
          height: 300,
          width: 400,
          child: Image.asset("Assets/Splash_img.jpg"),
        ),
      ),
    );
  }
}
