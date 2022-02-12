import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double widthValue;
  final double heightValue;
  CardContainer(
      {required this.color1,
      required this.color2,
      required this.cardChild,
      required this.widthValue,
      required this.heightValue});

  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
      width: widthValue,
      height: heightValue,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color1, color2]),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
