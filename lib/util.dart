
 import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

List<u_detail> user_List=[];
 List<u_detail> favoritList = [];

 List<TextStyle> fonts = [
  GoogleFonts.lato(),
  GoogleFonts.dancingScript(),
  GoogleFonts.freehand(),
  GoogleFonts.megrim(),
  GoogleFonts.moul(),
 ];

 XFile? xFile;


class u_detail{
 String? name;
 String? l_name;
 String? email;
 String? phone;
 String? address1;
 String? xFile;

 u_detail(
     {required this.name,
      required this.l_name,
      required this.address1,
      required this.email,
      required this.phone,
      // required this.rat,
     });

 void display(){
  print("name $name");
  print("email $email");
  print("phone $phone");
  print("address1 $address1");

 }

}


