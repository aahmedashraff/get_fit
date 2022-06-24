import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/small_image.dart';
import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_all_programs_screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final List<ProgramModel> allPrograms;

  const CategoryItem({Key key, this.categoryName, this.allPrograms})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4),
          child: Row(
            children: [
              Text(
                categoryName,
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
                  builder: (_) => ViewAllProgramsScreen(
                    categoryTitle: categoryName,
                    allPrograms: allPrograms,
                  ),
                )),
              )
            ],
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical),
        Container(
          //width: 300,
          height: SizeConfig.safeBlockVertical * 25,
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListView.builder(
            itemBuilder: (_, i) => Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: SmallImage(url: allPrograms[i].img),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProgramScreen(program: allPrograms[i]),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical),
                    Text(
                      "${allPrograms[i].weeks} Weeks",
                      style: TextStyle(
                        height: 1,
                        fontSize: SizeConfig.safeBlockVertical * 1.45,
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                if (allPrograms.indexOf(allPrograms[i]) !=
                    allPrograms.length - 1)
                  SizedBox(width: SizeConfig.safeBlockHorizontal * 2)
              ],
            ),
            itemCount: allPrograms.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4),
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical * 3)
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
