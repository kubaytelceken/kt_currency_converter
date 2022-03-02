import 'package:currency_converter/BlueCurrencyList.dart';
import 'package:currency_converter/OrangeCurrencyList.dart';
import 'package:currency_converter/cardBottom.dart';
import 'package:currency_converter/cardTop.dart';
import 'package:currency_converter/constants.dart';
import 'package:currency_converter/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'currency.dart';
import 'package:awesome_button/awesome_button.dart';
import 'package:intl/intl.dart';

class DasboardPage extends StatefulWidget {
  dynamic? currencyVal;
  dynamic? convertedCurrency;
  dynamic? currencyone;
  dynamic? currencytwo;
  dynamic? isWhite;

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
  late String _deger;
  double resultCurrency = 0;
  dynamic myController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController = TextEditingController(text: widget.currencyVal.toString());
    getCurrencyData();
  }

  void getCurrencyData() async {
    CurrencyService currencyService = CurrencyService();
    var currencyData =
        await currencyService.getCurrencyData(widget.currencyone);
    print(currencyData);

    UpdateUI(currencyData);
  }

  void UpdateUI(dynamic currData) {
    setState(() {
      String exchangeName = widget.currencytwo;
      double currencyValue = currData['rates']['$exchangeName'];
      resultCurrency =
          double.parse(myController.text.replaceAll(',', '.')) * currencyValue;
    });
  }

  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
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
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: myController,
                          textAlign: TextAlign.center,
                          style: kLargeTextStyle,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          onEditingComplete: () {
                            getCurrencyData();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        ),
                      ),
                      // Text(
                      //   "100",
                      //   style: kLargeTextStyle,
                      // ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: kSmallUnderTextStyle,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              this.context,
                              MaterialPageRoute(
                                  builder: (context) => BlueCurrencyListPage(
                                        currencyTwo: widget.currencytwo,
                                        currencyVal: widget.currencyVal,
                                      )));

                          // Navigator.of(context).push(CupertinoPageRoute(
                          //     builder: (context) => BlueCurrencyListPage(
                          //           currencyTwo: widget.currencytwo,
                          //         )));
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
                          Navigator.pushReplacement(
                              this.context,
                              MaterialPageRoute(
                                  builder: (context) => OrangeCurrencyListPage(
                                      currencyOne: widget.currencyone)));

                          // Navigator.of(context).push(CupertinoPageRoute(
                          //     builder: (context) => OrangeCurrencyListPage(
                          //           currencyOne: widget.currencyone,
                          //         )));
                        },
                        child: Text(
                          widget.currencytwo,
                          style: kSmallTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Center(
                            child: Text(
                              myFormat.format(resultCurrency),
                              // resultCurrency.toStringAsFixed(2),
                              style: kLargeTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        CurrencyService().getCurrencyString(widget.currencytwo),
                        style: kSmallTextStyle,
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
            child: AwesomeButton(
              blurRadius: 10.0,
              splashColor: Color.fromRGBO(255, 255, 255, .4),
              borderRadius: BorderRadius.circular(50.0),
              height: width * .2,
              width: width * .2,
              onTap: () {
                var temp = widget.currencyone;

                widget.currencyone = widget.currencytwo;
                widget.currencytwo = temp;
                getCurrencyData();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              color: Colors.white,
              child: Icon(
                MyFlutterApp.exchange,
                color: Color(0XFF4FF4B1F),
                size: 50.0,
              ),
            ),
            // child: Container(
            //   width: width * .2,
            //   height: height * .1,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: AssetImage("assets/images/exchangeIcon.png"),
            //           fit: BoxFit.cover,
            //           alignment: Alignment.center),
            //       color: Colors.white,
            //       border: Border.all(
            //           color: Color(0XFF4E54C8),
            //           style: BorderStyle.solid,
            //           width: 5.0)),
            // ),
          )
        ],
      ),
    );
  }
}
