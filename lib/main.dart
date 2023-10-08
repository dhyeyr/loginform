import 'package:flutter/material.dart';
import 'package:loginform/views/Form_page.dart';
import 'package:loginform/views/Splash_screen.dart';
import 'package:loginform/views/favorit_page.dart';
import 'package:loginform/views/user_detail.dart';

import 'constent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/": (context) => SplashScreen(),
        Form_page: (context) => form_page(map: {},),
        user_detail: (context) => UserListScreen(),
        fav_page: (context) => FavoriteUser(),
      },
    );
  }
}


