import 'package:CaptainSayedApp/models/album_item_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/before_after_image.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class AllBeforeAfter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AlbumItemModel>>(
          future: getAlbum(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.hasError)
              return Center(child: CircularProgressIndicator());
            return Padding(
              child: Column(
                children: [
                  Top(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Text(
                    "Before & After",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 4),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, i) => Column(
                        children: [
                          BeforeAndAfterImages(
                            afterImage:
                                "$imageBase_URL/${snapshot.data[i].image_after}",
                            beforeImage:
                                "$imageBase_URL/${snapshot.data[i].image_before}",
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * .5),
                          Text(
                            snapshot.data[i].user == null
                                ? ""
                                : snapshot.data[i].user["name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "Egypt",
                          //   style: TextStyle(color: Colors.black),
                          // ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2.5)
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      itemCount: snapshot.data.length,
                      padding:
                          EdgeInsets.only(top: SizeConfig.safeBlockVertical),
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 4,
                right: SizeConfig.safeBlockHorizontal * 4,
                top: MediaQuery.of(context).padding.top +
                    SizeConfig.safeBlockVertical * 2,
              ),
            );
          }),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
