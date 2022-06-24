import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../../../sizeConfig.dart';
import '../../view_all_screen/all_articles.dart';

class Beaf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Before / After",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 5,
            ),
            Text(
              '(70 Photos)',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.safeBlockVertical),
        Container(
          child: GestureDetector(
            child: ClipRRect(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 167,
                          child: Image.asset(
                            "assets/images/BA.png",
                            width: 397,
                            height: 167,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 7,
                          left: 15,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FavoriteButton(
                              iconSize: 35,
                              valueChanged: null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AllArticles(),
            )),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal),
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical * 3),
      ],
    );
  }
}
