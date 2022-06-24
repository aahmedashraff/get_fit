import 'package:CaptainSayedApp/screens/view_all_screen/all_befor_after.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class BeforeAndAfter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Before & After",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              InkWell(
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3,
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AllBeforeAfter(),
                )),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Container(
            child: GestureDetector(
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/Advanced.jpg",
                  width: double.infinity,
                  height: SizeConfig.safeBlockVertical * 25,
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AllBeforeAfter(),
              )),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 4,
                  // spreadRadius: 0,
                  offset: Offset(0, SizeConfig.safeBlockVertical * .25),
                )
              ],
              //border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal),
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
        ],
      ),
    );
  }
}
