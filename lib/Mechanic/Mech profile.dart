import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class Mech_Profile extends StatefulWidget {
  const Mech_Profile({super.key});

  @override
  State<Mech_Profile> createState() => _Mech_ProfileState();
}

class _Mech_ProfileState extends State<Mech_Profile> {


  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  var imageURL;
  XFile? _image;

  Future<void> pickimage() async {
    print("object");
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
        FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Uploaded succesfully",
              style: TextStyle(color: Colors.green),
            )));

        FirebaseFirestore.instance
            .collection("mechanics")
            .doc(ID)
            .update({'path': imageURL});
        print("/////////picked$imageURL");
        Navigator.pop(context);
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

  var namectrl = TextEditingController();
  var phonectrl = TextEditingController();
  var emailctrl = TextEditingController();
  var expctrl = TextEditingController();
  var shopctrl = TextEditingController();
  var locationctrl = TextEditingController();

  var ID = '';



  void getdata() async {
    final data = await SharedPreferences.getInstance();
    ID = data.getString('id')!;

    setState(() {});
  }

  updateprofile() async {
    await FirebaseFirestore.instance.collection("mechanics").doc(ID).update({
      "username": namectrl.text,
      "email id": emailctrl.text,
      "phone number": phonectrl.text,
      "work experience": expctrl.text,
      "shop name": shopctrl.text,
      "location":locationctrl.text,
    });
    Navigator.pop(context);
  }

  final _Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("Assets/profile img.png"),
                    ),
                    IconButton(onPressed: (){
                      pickimage();
                    }, icon: Icon(Icons.camera_alt))
                  ],
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: namectrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Name"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: phonectrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Phone Number"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: emailctrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Email"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Work Experience",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: expctrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Work Experience"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Workshop Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                    controller: shopctrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Your Shop Name"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text(
                        "Your Location",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },

                    controller: locationctrl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Your Location"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (_Key.currentState!.validate()) {
                        updateprofile();
                      }
                    },
                    child: Text(
                      "Submit",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
