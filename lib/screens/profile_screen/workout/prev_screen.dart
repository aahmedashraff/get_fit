import 'package:flutter/material.dart';

import '../../../sizeConfig.dart';

class PrevScreen extends StatefulWidget {
  @override
  State<PrevScreen> createState() => _PrevScreenState();
}

class _PrevScreenState extends State<PrevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockHorizontal * 6),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 31.5,
                ),
                Text(
                  "Privileges",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockHorizontal * 15),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(
                      color: Colors.grey.shade50,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 690,
                  width: 397,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Privileges',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/1.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/2.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/3.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/4.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/5.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/6.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/7.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/8.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/9.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/10.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/Group 2940.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/Group 2941.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/Group 2942.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/Group 2943.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/Group 2944.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/16.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/17.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/18.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/19.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/20.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/21.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/22.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/23.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/24.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/25.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 16),
                        child: Row(
                          children: [
                            Image.asset('assets/images/26.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/27.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/28.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/29.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                            Image.asset('assets/images/30.png'),
                            SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
