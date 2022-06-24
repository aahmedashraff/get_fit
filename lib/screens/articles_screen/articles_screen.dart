import 'package:CaptainSayedApp/screens/articles_screen/widgets/article_image.dart';
import 'package:CaptainSayedApp/screens/articles_screen/widgets/top.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final String name;
  final String image;
  final String date;
  final String body;

  const ArticleScreen({Key key, this.name, this.image, this.date,this.body})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: Column(
          children: [
            Top(),
            SizedBox(height: SizeConfig.safeBlockVertical * 4),
            // Text(
            //   "Article",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: SizeConfig.safeBlockHorizontal * 4,
            //   ),
            // ),
            // SizedBox(height: SizeConfig.safeBlockVertical),
            ArticleImage(image: image),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Row(
              children: [
                Text(
                  "Article Title/ ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Published/ ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    body,
                    textDirection: TextDirection.rtl ,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),
                  )
                ],
                padding: EdgeInsets.only(top: 0, bottom: 15),
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
