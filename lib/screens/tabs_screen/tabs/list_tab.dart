import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTabs extends StatefulWidget {
  @override
  _ListTabsState createState() => _ListTabsState();
}

class _ListTabsState extends State<ListTabs> {
  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserData>(context, listen: false).userToken;

    return FutureBuilder<Map<String, ProgramModel>>(
        future: getSaves(token: token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemBuilder: (_, i) => ListTile(
                    leading: ClipRRect(
                      child: Image.network(
                        "$imageBase_URL/${snapshot.data.values.toList()[i].img}",
                        width: SizeConfig.safeBlockHorizontal * 33,
                        height: SizeConfig.safeBlockVertical * 10,
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.safeBlockHorizontal),
                    ),
                    title: Text(
                      snapshot.data.values.toList()[i].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 3.7),
                    ),
                    subtitle: Text(
                      "${snapshot.data.values.toList()[i].weeks} weeks",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () async{
                       await removSave(token,snapshot.data.keys.toList()[i]);
                     if(mounted)  setState(() {
                                                
                                              });
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * .25,
                      horizontal: SizeConfig.safeBlockHorizontal * 3,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProgramScreen(
                                    program: snapshot.data.values.toList()[i],
                                  )));
                    },
                  ),
              itemCount: snapshot.data.length);
        });
  }
}
