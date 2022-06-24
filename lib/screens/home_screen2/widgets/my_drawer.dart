import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/screens/about_us_screen/about_us_screen.dart';
import 'package:CaptainSayedApp/screens/contact_us_screen/contact_us_screen.dart';
import 'package:CaptainSayedApp/screens/tabs_screen/tabs_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(
          //     vertical: MediaQuery.of(context).padding.top),
          alignment: Alignment.center,
          child: Text(
            "Get Fit",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 8,
                fontWeight: FontWeight.bold),
          ),
          height: MediaQuery.of(context).padding.top * 4,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF77382C),
                Theme.of(context).primaryColor,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        ListTile(
          title: const Text("FAVOURITES"),
          trailing: const Icon(
            Icons.star_border,
            color: Colors.black,
          ),
          onTap: () => Navigator.of(context).push(PageTransition(
            child: TabsScreen(indexOfPage: 0),
            type: PageTransitionType.rightToLeft,
          )),
        ),
        ListTile(
          title: const Text("MY LIST"),
          trailing: const Icon(
            Icons.list,
            color: Colors.black,
          ),
          onTap: () => Navigator.of(context).push(PageTransition(
            child: TabsScreen(indexOfPage: 1),
            type: PageTransitionType.rightToLeft,
          )),
        ),
        ListTile(
          title: const Text("DOWNLOADS"),
          trailing: const Icon(
            AppIcon.cloud_computing,
            color: Colors.black,
          ),
          onTap: () => Navigator.of(context).push(PageTransition(
            child: TabsScreen(indexOfPage: 2),
            type: PageTransitionType.rightToLeft,
          )),
        ),
        Spacer(),
        ListTile(
          // dense: true,
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
            horizontal: VisualDensity.minimumDensity,
          ),
          title: Text(
            "Info",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.safeBlockHorizontal * 4),
          ),
        ),
        ListTile(
          dense: false,
          title: const Text(
            "ABOUT US",
          ),
          onTap: () => Navigator.of(context).push(PageTransition(
            child: AboutUsScreen(),
            type: PageTransitionType.rightToLeft,
          )),
        ),
        ListTile(
          dense: false,
          title: const Text(
            "CONTACT US",
          ),
          onTap: () => Navigator.of(context).push(PageTransition(
            child: ContactUsScreen(),
            type: PageTransitionType.rightToLeft,
          )),
        ),
        Spacer(flex: 6)
      ],
    );
  }
}
