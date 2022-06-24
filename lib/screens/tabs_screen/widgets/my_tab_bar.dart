import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  // final TabController controller;
  final controller = PageController();

  MyTabBar({controller});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        indicatorColor: primaryColor,
        unselectedLabelColor: Colors.black,
        labelColor: primaryColor,
        tabs: [
          Tab(
            text: 'Programs',
          ),
          Tab(
            text: 'Exercises',
          ),
          // CreateTab(title: 'Programs'),
          // CreateTab(title: 'exercises'),
        ],
      ),
    );
  }
}
