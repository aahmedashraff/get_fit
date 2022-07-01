import 'package:CaptainSayedApp/screens/view_all_screen/all_articles.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      "Articles",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 8,
                  ),
                  Text(
                    '(46 Exercise)',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  SizedBox(
                    width: 31.w,
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
                                alignment: Alignment.center,
                                height: 242,
                                child: Image.asset(
                                  "assets/images/buildmuscle.png",
                                  width: 169,
                                  height: 242,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
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
                                height: 242,
                                child: Image.asset(
                                  "assets/images/loseweight.png",
                                  width: 169,
                                  height: 242,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
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
          ),
        );
      },
    );
  }
}
