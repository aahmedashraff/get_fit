import 'package:CaptainSayedApp/screens/view_all_screen/all_articles.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FullBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Full Body Workout",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '(5 Exercise)',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  SizedBox(
                    width: 24.w,
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: [
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 239,
                              child: Image.asset(
                                "assets/images/arm.png",
                                width: 169,
                                height: 242,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 8,
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
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 239,
                              child: Image.asset(
                                "assets/images/chest.png",
                                width: 169,
                                height: 242,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 8,
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
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 239,
                              child: Image.asset(
                                "assets/images/back.png",
                                width: 169,
                                height: 242,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 8,
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
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 239,
                              child: Image.asset(
                                "assets/images/shoulder.png",
                                width: 169,
                                height: 242,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 8,
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
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 239,
                              child: Image.asset(
                                "assets/images/legs.png",
                                width: 169,
                                height: 242,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 8,
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
          ),
        );
      },
    );
  }
}
