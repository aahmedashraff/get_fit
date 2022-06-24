import 'package:CaptainSayedApp/models/program_exercise_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/day_exercise_screen_new/day_exercise_detail_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesTabs extends StatefulWidget {
  // final List<ProgramExerciseModel> favExercises;
  // FavouritesTabs(this.favExercises);
  @override
  _FavouritesTabsState createState() => _FavouritesTabsState();
}

class _FavouritesTabsState extends State<FavouritesTabs> {
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserData>(context, listen: false).userToken;

    return FutureBuilder<Map<String, ProgramExerciseModel>>(
        future: getFavourite(token: token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError)
            return Center(
                child: CircularProgressIndicator(color: primaryColor));
          final favList = snapshot.data.values.toList();
          return ListView.builder(
            itemBuilder: (_, i) => ListTile(
                key: ValueKey(favList[i].id),
                leading: ClipRRect(
                  child: Image.network(
                    "$imageBase_URL/${favList[i].images[0]}",
                    width: SizeConfig.safeBlockHorizontal * 33,
                    height: SizeConfig.safeBlockVertical * 10,
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.safeBlockHorizontal),
                ),
                title: Text(
                  favList[i].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 3.7),
                ),
                subtitle: Text(
                  favList[i].exercise_duration == null ||
                          favList[i].exercise_duration == "0"
                      ? "${favList[i].reps} Reps"
                      : "${favList[i].exercise_duration} Sec",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    print(favList[i].id);
                    print(favList.length);
                    print("fddf");
                    await removeFav(token, snapshot.data.keys.toList()[i]);
                    if (mounted) setState(() {});
                  },
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * .25,
                  horizontal: SizeConfig.safeBlockHorizontal * 3,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DayExerciseDetailScreen(
                      isJustToShow: true,
                      isFromFav: true,
                      allExercises: [favList[i]],
                      exerciseIndex: 0,
                      // navFunc: navigationFun,
                    ),
                  ));
                }),
            itemCount: favList.length,
          );
        });
  }
}
