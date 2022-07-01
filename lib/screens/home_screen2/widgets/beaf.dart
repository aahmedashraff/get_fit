import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../sizeConfig.dart';
import '../../view_all_screen/all_articles.dart';

class Beaf extends StatelessWidget {
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
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Text(
                    "Before / After",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '(70 Photos)',
                  style:
                      TextStyle(color: Colors.grey.shade500, fontSize: 10.sp),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
            Container(
              child: GestureDetector(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 167,
                            child: Image.asset(
                              "assets/images/BA.png",
                              width: 95.w,
                              height: 6.h,
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
