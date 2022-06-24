import 'package:CaptainSayedApp/app_icon_icons.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectableRactangle extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isFirstElement;
  SelectableRactangle(
      {@required this.title,
      @required this.subtitle,
      this.isFirstElement = false});

  @override
  _SelectableRactangleState createState() => _SelectableRactangleState();
}

class _SelectableRactangleState extends State<SelectableRactangle> {
  bool _isSelected;
  @override
  void initState() {
    super.initState();
    _isSelected = widget.isFirstElement ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          
        });
        if (_isSelected && widget.title.contains("Fat")) {
            Provider.of <UserData>(context,listen: false).setGoal(1);
            
          }
          if (_isSelected && widget.title.contains("Mus")) {
            Provider.of <UserData>(context,listen: false).setGoal(2);
            
          }
      },
      child: LayoutBuilder(builder: (_, constraints) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: SizeConfig.safeBlockVertical * 2.1),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * .8),
                  Container(
                    child: Text(
                      widget.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockVertical * 1.5),
                    ),
                    width: SizeConfig.safeBlockHorizontal * 63,
                    alignment: Alignment.topLeft,
                  )
                ],
              ),
              if (_isSelected)
                Container(
                  child: Icon(
                    AppIcon.check,
                    color: Colors.white,
                    size: SizeConfig.safeBlockHorizontal * 6,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
                )
            ],
          ),
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
            border: Border.all(
              width: SizeConfig.safeBlockHorizontal * .2,
              color:
                  _isSelected ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 1.5,
            horizontal: SizeConfig.safeBlockHorizontal * 2.8,
          ),
        );
      }),
    );
  }
}
