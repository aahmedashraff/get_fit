import 'package:CaptainSayedApp/models/article_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/articles_screen/articles_screen.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/the_image.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/widgets/top.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class AllArticles extends StatelessWidget {
  //static const persons = ["Ahmed Ali", "Ali Omar", "Mohamed Reda"];
  static const articles = ["Street Fight", "Types of Equipments", "Some Tips"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ArticleModel>>(
          future: getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.hasError)
              return Center(child: CircularProgressIndicator());
            if (snapshot.hasError) {
              showErrorMessage(context: context);
              return Container();
            }
            return Padding(
              child: Column(
                children: [
                  Top(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                  Text(
                    "Articles",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 4),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, i) => Column(
                        children: [
                          GestureDetector(
                            child: TheImage(
                              image: "$imageBase_URL/${snapshot.data[i].img}",
                              isFromArticles: true,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ArticleScreen(
                                  image:
                                      "$imageBase_URL/${snapshot.data[i].img}",
                                  date: snapshot.data[i].created_at.substring(0,
                                      snapshot.data[i].created_at.indexOf("T")),
                                  name: snapshot.data[i].title,
                                  body: snapshot.data[i].description,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical),
                          Text(
                            snapshot.data[i].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data[i].created_at.substring(
                                0, snapshot.data[i].created_at.indexOf("T")),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 2)
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
    );
  }
}
