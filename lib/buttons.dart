import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class buttonn extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttonTapped;

  buttonn({this.color, this.textcolor, required this.buttontext, this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(color: textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
