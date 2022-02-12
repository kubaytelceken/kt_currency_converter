import 'package:currency_converter/card.dart';
import 'package:currency_converter/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CardContainer(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Türk Lirası",
                  style: kSmallTextStyle,
                ),
                Text(
                  "100",
                  style: kLargeTextStyle,
                ),
                Text(
                  "TL",
                  style: kSmallUnderTextStyle,
                )
              ],
            ),
            color1: Color(0XFF8F94FB),
            color2: Color(0XFF4E54C8),
            widthValue: double.infinity,
            heightValue: MediaQuery.of(context).size.height / 2,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 80.0,
          width: 80.0,
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/exchangeIcon.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
              color: Colors.white,
              border: Border.all(
                  color: Color(0XFF4E54C8),
                  style: BorderStyle.solid,
                  width: 5.0)),
        ),
        Expanded(
            child: CardContainer(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "USD",
                style: kSmallUnderTextStyle,
              ),
              Text(
                "7,65",
                style: kLargeTextStyle,
              ),
              Text(
                "Amerikan Doları",
                style: kSmallTextStyle,
              )
            ],
          ),
          color1: Color(0XFFFF9068),
          color2: Color(0XFF4FF4B1F),
          widthValue: double.infinity,
          heightValue: MediaQuery.of(context).size.height / 2,
        ))
      ],
    );
  }
}
