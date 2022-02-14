import 'package:currency_converter/BlueCurrencyList.dart';
import 'package:currency_converter/OrangeCurrencyList.dart';
import 'package:currency_converter/cardBottom.dart';
import 'package:currency_converter/cardTop.dart';
import 'package:currency_converter/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'currency.dart';

class DasboardPage extends StatefulWidget {
  late final currencyVal;
  late final convertedCurrency;
  late final currencyone;
  late final currencytwo;
  late final isWhite;

  DasboardPage(
      {required this.currencyVal,
      required this.convertedCurrency,
      required this.currencyone,
      required this.currencytwo,
      required this.isWhite});

  @override
  _DasboardPageState createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DasboardPage> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0XFFFF9068), Color(0XFFFF9068)]),
                ),
                child: CardContainerTop(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        CurrencyService().getCurrencyString(widget.currencyone),
                        style: kSmallTextStyle,
                      ),
                      Text(
                        "100",
                        style: kLargeTextStyle,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: kSmallUnderTextStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => BlueCurrencyListPage(
                                    currencyTwo: widget.currencytwo,
                                  )));
                        },
                        child: Text(
                          widget.currencyone,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  color1: Color(0XFF8F94FB),
                  color2: Color(0XFF4E54C8),
                  widthValue: width,
                  heightValue: height * .5,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0XFF4E54C8), Color(0XFF4E54C8)]),
                ),
                child: CardContainerBottom(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: kSmallUnderTextStyle,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => OrangeCurrencyListPage(
                                    currencyOne: widget.currencyone,
                                  )));
                        },
                        child: Text(
                          widget.currencytwo,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        "7,65",
                        style: kLargeTextStyle,
                      ),
                      Text(
                        CurrencyService().getCurrencyString(widget.currencytwo),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  color1: Color(0XFFFF9068),
                  color2: Color(0XFF4FF4B1F),
                  widthValue: width,
                  heightValue: height * .5,
                ),
              ),
            ],
          ),
          Positioned(
            left: width * .4,
            top: height * .5 - (width * .1),
            child: Container(
              width: width * .2,
              height: width * .2,
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
          )
        ],
      ),
    );
  }
}
