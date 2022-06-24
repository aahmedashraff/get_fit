import 'package:CaptainSayedApp/repos/repos_fun.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class OhterWaysToExercise extends StatefulWidget {
  // static const images = [
  //   "assets/images/Beginner.jpg",
  //   "assets/images/Intermediate.jpg",
  //   "assets/images/Advanced.jpg",
  // ];
  final void Function(int index) showOtherVideo;
  final List<String> images;

  const OhterWaysToExercise({this.showOtherVideo,this.images});
  @override
  _OhterWaysToExerciseState createState() => _OhterWaysToExerciseState();
}

class _OhterWaysToExerciseState extends State<OhterWaysToExercise> {
  var _indexOfOherWays = 0;
  var _controller = PageController(
    initialPage: 0,
  );
  void forwardOrReverse(bool isForward) {
    if (isForward) {
      _indexOfOherWays++;
      if (_indexOfOherWays == widget.images.length) {
        _indexOfOherWays = 0;
      }
    } else {
      _indexOfOherWays--;
      if (_indexOfOherWays == -1) {
        _indexOfOherWays = widget.images.length - 1;
      }
    }
    setState(() {});
    widget.showOtherVideo(_indexOfOherWays);
    _controller.animateToPage(_indexOfOherWays,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => forwardOrReverse(false),
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
              Container(
                child: PageView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: widget.images
                      .map((img) => Padding(
                            padding: EdgeInsets.only(
                                right: SizeConfig.safeBlockHorizontal),
                            child: ClipRRect(
                              child: Image.network(
                                "$imageBase_URL/$img",
                                width: SizeConfig.safeBlockHorizontal * 43 + 1,
                                height: SizeConfig.safeBlockVertical * 6,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockHorizontal * 2),
                            ),
                          ))
                      .toList(),
                ),
                height: SizeConfig.safeBlockVertical * 6,
                width: SizeConfig.safeBlockHorizontal * 43 + 1,
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => forwardOrReverse(true),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          RichText(
            text: TextSpan(
              children: [
                for (var i = 0; i < widget.images.length; i++)
                  TextSpan(
                    text: "${i + 1}  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: i == _indexOfOherWays
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
              ],
            ),
          ),
        ],
        //crossAxisAlignment: CrossAxisAlignment.center,
      ),
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical),
    );
  }
}
