import 'package:CaptainSayedApp/screens/program_screen/screen_widgets/program_image.dart';
import 'package:flutter/material.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';

class ProgramInfoScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String desc;

  ProgramInfoScreen({this.name, this.desc, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          child: Column(
            children: [
              ProgramImage(
                programName: name,
                isForProgramInfo: true,
                imageUrl: imageUrl,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      desc,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                  ],
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 4,
                    vertical: SizeConfig.blockSizeVertical,
                  ),
                ),
              )
            ],
          ),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
      backgroundColor: Color(0xFFE9E9E9),
    );
  }
}
