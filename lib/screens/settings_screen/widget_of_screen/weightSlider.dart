import 'package:flutter/material.dart';

class WeightSlider extends StatefulWidget {
  final void Function(int value) selectWeight;

  const WeightSlider({this.selectWeight});
  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  double _selctedWeight = 80.0;

  

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: _selctedWeight.toInt().toString(),

      value: _selctedWeight,
      min: 50,
      max: 200,
      onChanged: (value) {
        setState(() {
          _selctedWeight = value;
          widget.selectWeight(value.toInt());
        });
      },
      divisions: 150,
    );
  }
}
