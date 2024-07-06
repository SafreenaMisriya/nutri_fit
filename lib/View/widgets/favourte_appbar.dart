import 'package:flutter/material.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';

customfavappbar(BuildContext context){
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: blackcolor,)),
    title: myfonts2('Favorites'),
    centerTitle: true,
   
  );
}