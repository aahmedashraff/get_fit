// import 'package:CaptainSayedApp/app_icon_icons.dart';
// import 'package:CaptainSayedApp/providers/user_data.dart';
// import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/user_info_container.dart';
// import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/user_photo.dart';
// import 'package:CaptainSayedApp/screens/settings_screen/settings_screen.dart';
// import 'package:CaptainSayedApp/sizeConfig.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TopContainerContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: SizeConfig.screenHeight * 2 / 100,
//       ),
//       child: Column(
//         children: [
//           Spacer(flex: 5),
//           UserPhot(false),
//           Spacer(flex: 3),
//           UserInfoContainer(),
//           Spacer(flex: 3),
//           Icon(
//             AppIcon.placeholder,
//             color: Colors.white,
//             size: SizeConfig.safeBlockVertical * 2,
//           ),
//           Spacer(flex: 3),
//           Consumer<UserData>(
//             builder: (_, data, ch) => Text(
//               data.userCountry,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: SizeConfig.safeBlockVertical * 1.2,
//               ),
//             ),
//           ),
//           Spacer(flex: 3),
//           InkWell(
//             child: Container(
//               child: Text(
//                 "Edit Profile",
//                 style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 1.3),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(SizeConfig.safeBlockHorizontal),
//               ),
//               padding: EdgeInsets.symmetric(
//                 vertical: SizeConfig.safeBlockVertical * .3,
//                 horizontal: SizeConfig.safeBlockHorizontal * 39,
//               ),
//             ),
//             onTap: () =>
//                 Navigator.of(context).pushNamed(SettingScreen.screenName),
//           ),
//           Spacer(flex: 9),
//         ],
//       ),
//     );
//   }
// }
