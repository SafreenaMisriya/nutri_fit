import 'package:flutter/material.dart';
import 'package:nutri_fit/View/utils/colour.dart';

snakbarSuccessMessage(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding:const EdgeInsets.all(12),
    backgroundColor: greencolor,
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  ));
}
snakbardeleteMessage(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding:const EdgeInsets.all(12),
    backgroundColor: Colors.red,
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  ));
}