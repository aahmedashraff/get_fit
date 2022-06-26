import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/edit_save_btn.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/widgets/gen_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/gen_box2.dart';
import '../../widgets/next_or_submit_button.dart';

class GenderEditScreen extends StatefulWidget {
  static const screenName = "/gender-screen";
  final bool isActive;

  const GenderEditScreen({Key key, this.isActive}) : super(key: key);

  @override
  State<GenderEditScreen> createState() => _GenderEditScreenState();
}

class _GenderEditScreenState extends State<GenderEditScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //choose_gender_txt
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 4,
                    ),
                    Text(
                      "Your Gender",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 1.5),
                    Text(
                      "Let's change your Gender",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          CreateGenderBox(male: true),
          CreateGenderBoxxx(male: false),

          GestureDetector(
            onTap: () => Navigator.of(context).pop,
            child: EditSaveButton("Save"),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
        ],
      ),
    );
  }
}
