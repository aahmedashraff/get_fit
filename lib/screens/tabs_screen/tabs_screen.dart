import 'package:CaptainSayedApp/screens/tabs_screen/tabs/downloads_tab.dart';
import 'package:CaptainSayedApp/screens/tabs_screen/tabs/favourites_tab.dart';
import 'package:CaptainSayedApp/screens/tabs_screen/tabs/list_tab.dart';
import 'package:CaptainSayedApp/screens/tabs_screen/widgets/my_tab_bar.dart';
import 'package:CaptainSayedApp/screens/tabs_screen/widgets/top_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final int indexOfPage;

  const TabsScreen({this.indexOfPage});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller =
        TabController(vsync: this, length: 3, initialIndex: widget.indexOfPage);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TopScreen(),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            MyTabBar(controller: _controller),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  FavouritesTabs(),
                  ListTabs(),
                  DownloadsTabs(),
                ],
              ),
            )
          ],
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
