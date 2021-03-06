import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'UI.dart';

Container buildTheBottomContainer() {
  return Container(
    width: double.infinity,
    height: 33,
    color: Colors.white,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIconYoutube(),
          buildTextYoutube(),
        ],
      ),
    ),
  );
}

InkWell buildTextYoutube() {
  return InkWell(
    onTap: () {
      launchURL("https://www.youtube.com/gammaltech?sub_confirmation=1");
    },
    child: const Text(
      "© 2021 Gammal Tech. All rights reserved.",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

InkWell buildIconYoutube() {
  return InkWell(
    onTap: () {
      launchURL("https://www.youtube.com/gammaltech?sub_confirmation=1");
    },
    child: Image.asset(
      "asset/images/youtube.png",
      fit: BoxFit.cover,
      width: 35,
      height: 70,
    ),
  );
}

launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showToast('Could not launch : $url');
  }
}
