import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const screenName = "/notification-screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 8),
                Row(
                  children: [
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 30,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 150),
              child: Container(
                width: 397,
                height: 85,
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    elevation: MaterialStateProperty.all(10),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: null,
                  child: Row(
                    children: [
                      Image.asset('assets/images/achivment.png'),
                      SizedBox(width: 15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Achievement',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                              Text(
                                'I Got Your First Achievement For Completing Some Exercises',
                                style: TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //messagesRow
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 260),
              child: Container(
                width: 397,
                height: 85,
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    elevation: MaterialStateProperty.all(10),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: null,
                  child: Row(
                    children: [
                      Image.asset('assets/images/timer.png'),
                      SizedBox(width: 15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Program',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                              Text(
                                'Weight Loss Program Is Now Available,Try It Now',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
