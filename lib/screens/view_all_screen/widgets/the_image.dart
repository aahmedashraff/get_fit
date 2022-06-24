import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class TheImage extends StatelessWidget {
  final String image;
  final bool isFromArticles;

  const TheImage({this.image, this.isFromArticles});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: 
        // Image.asset(
          Image.network(
          image,
          width: double.infinity,
           height: isFromArticles
                ? SizeConfig.safeBlockVertical * 20
                : null,
            fit:isFromArticles
                ?BoxFit.cover: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
      ),
    );
  }
}
