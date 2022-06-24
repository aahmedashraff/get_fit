import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String image;

  const ArticleImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
              child: Image.network(
                image,
                height: SizeConfig.safeBlockVertical * 24,
                
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2)),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, -SizeConfig.safeBlockVertical * .25),
          )
        ],
      ),
    );
  }
}
