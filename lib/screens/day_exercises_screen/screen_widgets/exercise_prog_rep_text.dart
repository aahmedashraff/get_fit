import 'package:flutter/material.dart';

class ExerciseProgramRepText extends StatelessWidget {
  final String repetitionText;
  final bool hasDuration;
  ExerciseProgramRepText(this.repetitionText,{this.hasDuration});
  @override
  Widget build(BuildContext context) {
    // String reps;
    // print(repetitionText);
    // if (repetitionText.contains("/")) {
    //   if ((!repetitionText.contains("m") && !repetitionText.contains("sec"))) {
    //     reps =
    //         "${repetitionText.substring(0, repetitionText.indexOf("/"))} Reps";
    //   } else {
    //     reps = "${repetitionText.substring(0, repetitionText.indexOf("/"))}";
    //   }
    // } else
    //   reps = repetitionText;
    // print(reps);

    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: repetitionText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: hasDuration?" Sec":" Reps",
          style: TextStyle(color: Colors.black),
        ),
      ]),
    );
  }
}

// RichText(
//       text: TextSpan(
//         text: reps.substring(
//           0,
//           reps.indexOf(" ")

//         ),
//         style: TextStyle(fontWeight: FontWeight.bold),
//         children: [
//           TextSpan(text: reps.substring(reps.indexOf(" ")+1))
//         ]
//       ),
//     )
