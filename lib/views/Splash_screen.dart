import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginform/constent.dart';

import 'Form_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, user_detail);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Center(
          child: Image.asset("Image/form.png",height: 300,width: 400),
        ),
      ),
    );
  }
}
