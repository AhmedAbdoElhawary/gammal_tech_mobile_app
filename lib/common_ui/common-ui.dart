import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black);
}

ListTile listTileOfDropMenu(BuildContext context, String text, var page) {
  return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      });
}






