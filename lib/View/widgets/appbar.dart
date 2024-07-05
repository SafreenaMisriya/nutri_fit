import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

customappbar(String url){
  return AppBar(
    
    title: const Text('Nutri fit'),
    centerTitle: true,
    actions: [
      IconButton(onPressed: (){
        Share.share(url);
      }, icon:const  Icon(Icons.share))
    ],
  );
}