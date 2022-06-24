import 'package:CaptainSayedApp/screens/articles_screen/articles_screen.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  final String title;
  final int programNum;

  const ViewAllScreen({this.title, this.programNum});

  static const programsName = const [
    "Beginner",
    "Intermediate",
    "Fat",
  ];

  @override
  Widget build(BuildContext context) {
    final name = programNum == 3 ? "Fat Burning" : programsName[programNum - 1];
    final subtitle = title == "Articles"
        ? "Street Fight"
        : (title == "Before & After" ? "Ali Ahmed" : "4 weeks");
    return Scaffold(
      body: Padding(
        child: Column(
          children: [
            Top(),
            SizedBox(height: SizeConfig.safeBlockVertical * 4),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.safeBlockHorizontal * 4),
            ),
            Expanded(
              child: ListView(
                children: [
                  Stack(children: [
                    // ProgramItem(
                    //   programName: programsName[programNum - 1],
                    //   isClosedProgram: false,
                    //   isFromNewHome: true,
                    // ),
                    if (title == "Articles")
                      Positioned.fill(
                          child: GestureDetector(
                        child: Container(
                          color: Colors.transparent,
                          // width: double.infinity,
                          // height: double.infinity,
                        ),
                        onTap: title == "Articles"
                            ? () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ArticleScreen()))
                            : () {},
                      ))
                  ]),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.safeBlockVertical * 1.5,
                      left: SizeConfig.safeBlockHorizontal,
                      top: SizeConfig.safeBlockVertical * .25,
                    ),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: title == "Before & After"
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (title == "Before & After") Text("Egypt"),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
                //crossAxisAlignment: CrossAxisAlignment.start,
                padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 4,
          right: SizeConfig.safeBlockHorizontal * 4,
          top: MediaQuery.of(context).padding.top +
              SizeConfig.safeBlockVertical * 2,
        ),
      ),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
