import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_fit/View/utils/colour.dart';

myfonts(String text){
  return Text(text,style: GoogleFonts.bonaNova(fontWeight: FontWeight.w600,color: greencolor),);
}
myfonts2(String text){
  return Text(text,style: GoogleFonts.bonaNova(fontWeight: FontWeight.bold,color: greencolor,fontSize: 16),);
}
myfonts3(String text){
  return Text(text,style: GoogleFonts.roboto(fontWeight: FontWeight. w400,color: whitecolor,fontSize: 15),);
}
myfonts4(String text){
  return Text(text,style: GoogleFonts.roboto(fontWeight: FontWeight. w400,color:Colors.black,fontSize: 15),);
}
