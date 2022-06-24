import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:flutter/material.dart';

class CheckBoxItem extends StatefulWidget {
  final bool intiallySelected;
  final String title;
  CheckBoxItem({this.intiallySelected, this.title});

  @override
  _CheckBoxItemState createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  bool _selected;
  @override
  void initState() {
    super.initState();
    _selected = widget.intiallySelected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 5,
        right: SizeConfig.safeBlockHorizontal * 3,
      ),
      child: CheckboxListTile(
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value;
          });
        },
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        activeColor: Colors.black,
        //dense: true,
      ),
    );
  }
}
