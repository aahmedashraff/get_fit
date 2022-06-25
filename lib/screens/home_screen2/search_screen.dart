import 'package:CaptainSayedApp/models/program_model.dart';
import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/search_bar.dart';
import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchResult = <ProgramModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Hero(
              tag: "ss",
              child: SearchBar(
                getTextFieldValue: (searchWord) async {
                  if (searchWord.isEmpty) {
                    if (searchResult.isNotEmpty) {
                      setState(() {
                        searchResult.clear();
                      });
                    }
                    return;
                  }
                  final res = await search(searchWord);
                  setState(() {
                    searchResult = res;
                  });
                },
                isComingFromSearchScreen: true,
              ),
            ),
            if (searchResult.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) => ListTile(
                    title: Text(searchResult[i].title),
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await Future.delayed(Duration(milliseconds: 100));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProgramScreen(
                                    program: searchResult[i],
                                  )));
                    },
                  ),
                  itemCount: searchResult.length,
                ),
              )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
