// import 'package:flutter/material.dart';
//
// class Mech_Add_Service extends StatefulWidget {
//   const Mech_Add_Service({super.key});
//
//   @override
//   State<Mech_Add_Service> createState() => _Mech_Add_ServiceState();
// }
//
// class _Mech_Add_ServiceState extends State<Mech_Add_Service> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AlertDialog(
//        backgroundColor: Colors.blue.shade200,
//         title: Center(
//             child: Text("Add service"),
//         ),
//         titleTextStyle: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           color: Colors.black
//         ),
//         content: Container(
//           height: 200,
//           width: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                     decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               focusedBorder: UnderlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(
//                   color: Colors.blue.shade200
//                 )
//               )
//                     ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                 ),
//                   onPressed: (){},
//                   child: Text("Add",style: TextStyle(fontSize: 20),))
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// Add()=> AlertDialog(
//     backgroundColor: Colors.blue.shade200,
//     title: Center(
//       child: Text("Add service"),
//     ),
//     titleTextStyle: TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//         color: Colors.black
//     ),
//     content: Container(
//       height: 200,
//       width: 300,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: UnderlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                         color: Colors.blue.shade200
//                     )
//                 )
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: (){},
//               child: Text("Add",style: TextStyle(fontSize: 20),))
//         ],
//       ),
//     ),
//   );
//
