import 'package:flutter/material.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

Padding buildTheVideo(bool checkForPadding, bool checkForHeight) {
  const videoId = '70591644';
  return Padding(
    padding: checkForPadding
        ? const EdgeInsets.only(top: 15, right: 10, left: 10)
        : const EdgeInsets.only(top: 15, right: 15, left: 15),
    child: Container(
      color: Colors.white,
      width: double.infinity,
      height: checkForHeight ? 170 : 186,
      child: const VimeoPlayer(videoId: videoId),
      // child: VimeoPlayer(
      //   videoId: videoId,
      // ),
    ),
  );
}
