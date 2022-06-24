import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class GetFitText extends StatefulWidget {
  final bool isJustWatingForStreamBuilder;

  const GetFitText({this.isJustWatingForStreamBuilder});

  @override
  _GetFitTextState createState() => _GetFitTextState();
}

class _GetFitTextState extends State<GetFitText> {
  var getWordOpacity = 0.0;
  var fitWordOpacity = 0.0;
  @override
  void initState() {
    if (!widget.isJustWatingForStreamBuilder) {
      Future.delayed(Duration(milliseconds: 150), () {
       
         if (mounted) setState(() {
          getWordOpacity = 1.0;
        });
      });
      Future.delayed(Duration(seconds: 3), () {
        if (mounted)
          setState(() {
            fitWordOpacity = 1.0;
          });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedOpacity(
          opacity: widget.isJustWatingForStreamBuilder ? 0.0 : getWordOpacity,
          duration: Duration(seconds: 4),
          curve: Curves.easeInQuad,
          child: Text(
            "Get",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: SizeConfig.safeBlockHorizontal * 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: widget.isJustWatingForStreamBuilder ? 0.0 : fitWordOpacity,
          duration: Duration(seconds: 4),
          curve: Curves.easeInQuad,
          child: Text(
            " Fit",
            style: Theme.of(context).textTheme.headline2.copyWith(
                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
