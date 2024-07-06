import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_fit/View/utils/colour.dart';

myfonts(String text){
  return Text(text,style: GoogleFonts.bonaNova(fontWeight: FontWeight.w600,color: greencolor),);
}
myfonts2(String text){
  return Text(text,style: GoogleFonts.bonaNova(fontWeight: FontWeight.bold,color: greencolor,fontSize: 18),);
}
myfonts3(String text){
  return Text(text,style: GoogleFonts.roboto(fontWeight: FontWeight. bold,color: whitecolor,fontSize: 17),);
}
myfonts4(String text){
  return Text(text,style: GoogleFonts.bonaNova(fontWeight: FontWeight. w600,color:Colors.black,fontSize: 16),);
}
myfonts5(String text){
  return Text(text,style: const TextStyle(fontWeight: FontWeight. w600,color:Colors.black,fontSize: 16),);
}
heading(String text){
  return Text(text,style:GoogleFonts.rubikGlitchPop(fontWeight: FontWeight. bold,color:lightgreen,fontSize: 30),);
}
myfonts6(String text){
  return Text(text,style: GoogleFonts.roboto(fontWeight: FontWeight. bold,color: greencolor,fontSize: 17),);
}
