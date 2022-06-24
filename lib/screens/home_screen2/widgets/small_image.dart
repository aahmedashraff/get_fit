
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmallImage extends StatelessWidget {
  final String url;
  SmallImage({this.url});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$imageBase_URL/$url",
      width: SizeConfig.safeBlockHorizontal * 65,
      height: SizeConfig.safeBlockVertical * 20,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

    // ClipRRect(
    //   child: Image.network(
    //     "$imageBase_URL/$url",
    //     width: SizeConfig.safeBlockHorizontal * 65,
    //     height: SizeConfig.safeBlockVertical * 20,
    //     fit: BoxFit.cover,
    //   ),
    //   borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal),
    // );
  }
}
