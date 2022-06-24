import 'package:CaptainSayedApp/screens/downloads_screen.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_constant.dart';
import '../../premium_acc_screen/premium_acc_screen.dart';

class BottomNavigationToolBar extends StatefulWidget {
  @override
  _BottomNavigationToolBarState createState() =>
      _BottomNavigationToolBarState();
}

class _BottomNavigationToolBarState extends State<BottomNavigationToolBar> {
  int navigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: BottomNavigationBar(
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home3.png'),
              size: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/favorites.png'),
              size: 35,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/inbox.png'),
              size: 35,
            ),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/reward.png'),
              size: 35,
            ),
            label: 'Premium',
          ),
        ],
        currentIndex: navigationBarIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: isDark ? Colors.grey.shade600 : Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          if (index == 2) {
            setState(() {
              navigationBarIndex = index;
            });
            await Future.delayed(const Duration(milliseconds: 200));
            Navigator.of(context).pushNamed(DownloadsScreen.screenName);
            setState(() {
              navigationBarIndex = 0;
            });
          } else if (index == 1) {
            setState(() {
              navigationBarIndex = index;
            });
            await Future.delayed(const Duration(milliseconds: 200));

            Navigator.of(context).pushNamed(PremiumAccScreen.screenName);

            setState(() {
              navigationBarIndex = 0;
            });
          } else if (index == 3) {
            setState(() {
              navigationBarIndex = index;
            });
            await Future.delayed(const Duration(milliseconds: 200));

            Navigator.of(context).pushNamed(PremiumAccScreen.screenName);
            setState(() {
              navigationBarIndex = 0;
            });
          }
        },
      ),
    );
  }
}
