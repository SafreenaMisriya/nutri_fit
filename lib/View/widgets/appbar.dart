import 'package:flutter/material.dart';
import 'package:nutri_fit/View/utils/colour.dart';
import 'package:nutri_fit/View/utils/fonts.dart';
import 'package:share_plus/share_plus.dart';
customappbar(String url,BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: greencolor,
    automaticallyImplyLeading: false,
    leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: whitecolor,)),
    title: myfonts3('Nutri Fit'),
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){
        Share.share(url);
      }, icon: Icon(Icons.share,color: whitecolor,))
    ],
  );
}