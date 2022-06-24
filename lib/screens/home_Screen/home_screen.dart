// import 'package:CaptainSayedApp/providers/user_data.dart';
// import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/bottom_navigation_bar.dart';
// import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/home_two_texts.dart';
// import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
// import 'package:CaptainSayedApp/sizeConfig.dart';
// import 'package:CaptainSayedApp/widgets/exercise_type_item.dart';
// import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/program_item.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   static const screenName = "/Home";
//   static const programsName = const [
//     "Beginner",
//     "Intermediate",
//     "Advanced",
//     "Fat",
//   ];
//   static const exercisesTitle = const [
//     "Chest",
//     "Back",
//     "Shoulder",
//     "Arm",
//     "Abs",
//     "Legs",
//   ];

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ListView(
//             children: [
//               Container(
//                 height: SizeConfig.safeBlockVertical * 32,
//                 child: PageView(
//                   controller: PageController(
//                     initialPage: 0,
//                     viewportFraction: 1.01,
//                   ),
//                   children: [
//                     ...HomeScreen.programsName
//                         .map((name) => Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal:
//                                       SizeConfig.safeBlockHorizontal / 2),
//                               child: ProgramItem(
//                                 programName: name,
//                                 programNum:
//                                     HomeScreen.programsName.indexOf(name) + 1,
//                                 isClosedProgram: name == "Advanced",
//                               ),
//                             ))
//                         .toList()
//                   ],
//                   scrollDirection: Axis.horizontal,

//                 ),
//               ),
//               SizedBox(height: SizeConfig.safeBlockVertical),
//               HomeTwoTexts(),
//               SizedBox(height: SizeConfig.safeBlockVertical),
//               ...HomeScreen.exercisesTitle
//                   .map(
//                     (title) => ExerciseTypeItem(
//                       exerciseName: title,
//                     ),
//                   )
//                   .toList(),
//               //SizedBox(height: SizeConfig.safeBlockVertical * 10)
//             ],
//           ),
//           // Positioned(
//           //   bottom: 0,
//           //   //left: SizeConfig.safeBlockHorizontal * 20,
//           //   child: BottomNavigationToolBar(),
//           // ),
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         child: BottomNavigationToolBar(),
//        // height: SizeConfig.safeBlockVertical * 6,
//        height: 56,
//       ),
//     );
//   }
// }
