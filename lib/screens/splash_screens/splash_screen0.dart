// // import 'dart:html';
//
// import 'package:CaptainSayedApp/main.dart';
// import 'package:CaptainSayedApp/screens/aftersplash.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
//
// import '../../sizeConfig.dart';
//
// class Splash0 extends StatefulWidget {
//   static const screenName = "/splash0";
//   final bool isJustWatingForStreamBuilder;
//   final bool wilNavigateToHome;
//   const Splash0(
//       {this.isJustWatingForStreamBuilder, this.wilNavigateToHome = false});
//
//   @override
//   _Splash0State createState() => _Splash0State();
// }
//
// class _Splash0State extends State<Splash0> {
//   @override
//   void initState() {
//     if (!widget.isJustWatingForStreamBuilder) {
//       Future.delayed(
//         const Duration(seconds: 8),
//         () {
//           widget.wilNavigateToHome
//               ? Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (_) => HomeScreen()), (_) => false)
//               : Navigator.of(context).pushAndRemoveUntil(
//                   PageTransition(
//                     child: AfterSplash(),
//                     type: PageTransitionType.rotate,
//                   ),
//                   (_) => false);
//         },
//       );
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: SizeConfig.screenHeight,
//           width: SizeConfig.screenWidth,
//           child: Image.asset(
//             'assets/images/logoo.png',
//             fit: BoxFit.scaleDown,
//           ),
//         ),
//       ],
//     );
//   }
// }
