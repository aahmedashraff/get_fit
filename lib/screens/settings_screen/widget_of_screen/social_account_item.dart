import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialAccountItem extends StatelessWidget {
  final String title;
  final Function onPress;

  const SocialAccountItem({
    this.title,
    this.onPress,
  });

  Future<void> _launchApp() async {
    String url = title == "insta"
        ? "https://www.instagram.com/sayed_hussien.fit/"
        : (title == "face"
            ? "https://www.facebook.com/sayedhussien32/"
            : "https://www.youtube.com/channel/UCxg5X7NczVjUUMe-OWHFlrw");

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchApp,
      child: Column(
        children: [
          Image.asset(
            "assets/images/$title.png",
            width: SizeConfig.safeBlockVertical * 5,
            height: SizeConfig.safeBlockVertical * 6,
          ),
        ],
      ),
    );
  }
}
