// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constent.dart';
import '../util.dart';

class form_page extends StatefulWidget {
  Map map = {};

  form_page({super.key, required this.map});

  @override
  State<form_page> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<form_page> {
  MaritalStatus? selectedMaritalStatus;
  bool isFirst = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = "";

  final ImagePicker picker = ImagePicker();

  void _addUser() {
    final String fname = nameController.text;
    final String lname = lnameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String address = addressController.text;
   // final String rating = ratingController.text;

    if (fname.isNotEmpty &&
        lname.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty) {
      setState(() {
        user_List.add(u_detail(
            name: fname,
            l_name: lname,
            email: email,
            phone: phone,
           // rat: rating,
            address1: address));
      });

      nameController.clear();
      lnameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
      Navigator.pushNamed(context, user_detail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Login "),
        elevation: 0,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(21),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 10, blurStyle: BlurStyle.solid)
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Login Form",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black,
                            backgroundImage: xFile != null
                                ? FileImage(
                                    File(xFile?.path ?? ""),
                                  )
                                : null,
                            child: Text("Add"),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          //right: 0,
                          left: 45,
                          child: IconButton(
                              onPressed: () async {
                                // XFile? file = await picker.pickImage(source: ImageSource.gallery);
                                xFile = await picker.pickImage(
                                    source: ImageSource.camera);

                                setState(() {});
                              },
                              icon: Icon(Icons.camera_alt_rounded)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            // initialValue: "",
                            controller: nameController,
                            onFieldSubmitted: (value) {
                              print("onFieldSubmitted $value");
                            },

                            onSaved: (newValue) {
                              print("On Save $newValue");
                              name = newValue ?? "";
                            },
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your username',
                                hintStyle: TextStyle(color: Colors.black54)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: lnameController,
                            onFieldSubmitted: (value) {
                              print("onFieldSubmitted $value");
                            },
                            onSaved: (newValue) {
                              print("On Save $newValue");
                            },
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Your Last Name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your username',
                                hintStyle: TextStyle(color: Colors.black54)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                            child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Email address";
                            } else if (!value!.contains("@")) {
                              return "Enter Valid Email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-Mail',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.phone_android, color: Colors.black54),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            onSaved: (newValue) {},
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Phone Number";
                              } else if (int.tryParse(value ?? "") == null) {
                                return "Enter Valid Phone Number";
                              } else if (value?.length != 10) {
                                return null;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(

                              border: OutlineInputBorder(),
                              labelText: 'Enter Number',
                              // prefix: Icon(Icons.phone_android),
                              // prefixIcon: Icon(Icons.phone_android),
                              hintStyle: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.transgender_sharp, color: Colors.black54),
                        SizedBox(
                          width: 10,
                        ),
                        Radio(
                          value: MaritalStatus.Male,
                          groupValue: selectedMaritalStatus,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            selectedMaritalStatus = value;
                            setState(() {});
                            print("value $value");
                          },
                        ),
                        InkWell(
                          onTap: () {
                            selectedMaritalStatus = MaritalStatus.Male;
                            setState(() {});
                          },
                          child: Text("Male"),
                        ),
                        Radio(
                          value: MaritalStatus.Female,
                          groupValue: selectedMaritalStatus,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            selectedMaritalStatus = value;
                            setState(() {});
                            print("value $value");
                          },
                        ),
                        InkWell(
                          onTap: () {
                            selectedMaritalStatus = MaritalStatus.Female;
                            setState(() {});
                          },
                          child: Text("Female"),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                maxLines: 3,
                                controller: addressController,
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  if (value?.isEmpty ?? false) {
                                    return "Enter Address";
                                  } else {
                                    return null;
                                  }
                                },
                                // obscureText: true,
                                // obscuringCharacter: "-",
                                decoration: InputDecoration(
                                  hintText: "Address",
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your Location',
                                  // prefix: Icon(Icons.phone_android),
                                  // prefixIcon: Icon(Icons.phone_android),
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                            ),
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                FocusScope.of(context).unfocus(); // For keyboard Close
                                formKey.currentState?.save();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("User Created Successfully"),
                                  duration: Duration(seconds: 6),
                                  backgroundColor: Colors.yellow,
                                  action: SnackBarAction(
                                    label: "Success",
                                    onPressed: () {},
                                  ),
                                ));
                                _addUser();
                              } else {
                                print("Invalid");
                              }
                            },
                            child: Text("Login")),
                        SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                            ),
                            onPressed: () {
                              print("Reset");
                              nameController.clear();
                              lnameController.clear();
                              emailController.clear();
                              phoneController.text = "";
                              addressController.text = "";
                              formKey.currentState?.reset();
                              FocusScope.of(context)
                                  .unfocus(); // For keyboard Close
                            },
                            child: Text("Reset")),
                      ],
                    )



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MaritalStatus { Male, Female }
