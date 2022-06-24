import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class BeforeAndAfterImages extends StatelessWidget {
  final String beforeImage;
  final String afterImage;

  const BeforeAndAfterImages({Key key, this.beforeImage, this.afterImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            child: FullScreenWidget(
              child: Hero(tag: "before $beforeImage",
                child: ClipRRect(
                  child:
                      // Image.asset(
                      CachedNetworkImage(
                    imageUrl: beforeImage,
                    // width: double.infinity,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
                ),
              ),
            ),
            constraints: BoxConstraints(minWidth: SizeConfig.safeBlockHorizontal*25),
          ),
        ),
        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
        Flexible(
          child: Container(
            child: FullScreenWidget(
              child: Hero(tag: "$afterImage after",
                child: ClipRRect(
                  child:
                      // Image.asset(
                      CachedNetworkImage(
                    imageUrl: afterImage,
                    // width: double.infinity,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
                ),
              ),
            ),
            constraints: BoxConstraints(minWidth: SizeConfig.safeBlockHorizontal*25)
          ),
        )
      ],
    );
  }
}
