import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../sizeConfig.dart';
import '../../../theme/theme_constant.dart';
import '../../view_all_screen/all_articles.dart';

class LoseWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Lose Weight",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 5,
                ),
                Text(
                  '(1 Program)',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                SizedBox(
                  width: 41.w,
                ),
                InkWell(
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 3,
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AllArticles(),
                  )),
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
                              padding: EdgeInsets.only(left: 3.w),
                              height: 167,
                              width: 95.w,
                              child: Image.asset(
                                "assets/images/Group 3087.png",
                                height: 167,
                                width: 95.w,
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
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
          ],
        );
      },
    );
  }
}
