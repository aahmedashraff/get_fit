import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/view_all_screen/view_all_premium_screen.dart';
import 'package:CaptainSayedApp/services/show_auth_error_message.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PremuimPrograms extends StatefulWidget {
  @override
  _PremuimProgramsState createState() => _PremuimProgramsState();
}

class _PremuimProgramsState extends State<PremuimPrograms> {
  var _isLoading = false;
  var passCode = "";
  Future<void> go() async {
    if (passCode.isEmpty || passCode.length <= 2) return;

    if (mounted)
      setState(() {
        _isLoading = true;
      });
    try {
      final programms = await getPremiumPrograms(
        passcode: passCode,
        token: Provider.of<UserData>(context, listen: false).userToken,
      );
      if (mounted)
        setState(() {
          _isLoading = false;
        });
      FocusScope.of(context).unfocus();
      await Future.delayed(Duration(milliseconds: 70));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ViewAllPremiumScreen(
            allPrograms: programms,
          ),
        ),
      );
    } catch (e) {
      if (mounted)
        setState(() {
          _isLoading = false;
        });
      if (mounted)
        showDialogMessage(
          context: context,
          title: "Error",
          message:
              "This pass code may be wrong\nPlease check your connection ang try again.",
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Premium Programs",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/images/Intermediate.jpg",
                  width: double.infinity,
                  height: SizeConfig.safeBlockVertical * 25,
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal,
                      ),
                      color: Colors.black.withOpacity(.5)),
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      child: TextField(
                        onSubmitted: (_)=>go(),
                        onChanged: (value) => passCode = value,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        // cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration.collapsed(
                          hintText: "*******",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 3,
                        vertical: SizeConfig.safeBlockVertical * .75,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 22,
                        vertical: SizeConfig.safeBlockVertical * .5,
                      ),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 2),
                      ),
                    ),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : FlatButton(
                            child: const Text(
                              "Go",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockHorizontal * 2),
                            ),
                            onPressed: () {
                              go();
                            },
                          )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
