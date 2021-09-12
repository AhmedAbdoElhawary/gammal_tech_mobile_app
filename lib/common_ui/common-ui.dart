import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gammal_tech_mobile_app/the_pages/account_page.dart';
import 'package:gammal_tech_mobile_app/the_pages/sign_in_page.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

User? user = FirebaseAuth.instance.currentUser;
Center biuldTextButton(BuildContext context, bool checkAccount) {
  return Center(
    child: Card(
      color: Color.fromARGB(255, 0, 118, 125),
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      checkAccount != true ? signInPage() : accountPage()));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(
            checkAccount ? 'My Account' : 'Sign In',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

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

Card buildTextButton(String text, page, context) {
  return Card(
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      height: 55,
      child: TextButton(
        onPressed: () {
          if (page != null)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}

Padding buildTheVideo(bool checkForPadding,bool checkForHeight) {
  const videoId = '70591644';
  return Padding(
    padding:checkForPadding?const EdgeInsets.only(top: 15, right:10, left: 10):const EdgeInsets.only(top: 15, right:15, left: 15),
    child: Container(
        color: Colors.white,
      width: double.infinity,
      height:checkForHeight?170:186,
      child: VimeoPlayer(videoId: videoId),
      // child: VimeoPlayer(
      //   videoId: videoId,
      // ),
    ),
  );
}

Card TheHeadCardOfText(String title) {
  return Card(
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    elevation: 5,
    color: Colors.black,
    child: Container(
      height: 47,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
