import 'package:currency_converter/constants.dart';
import 'package:currency_converter/dashboard.dart';
import 'package:currency_converter/dashboardPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueCurrencyListPage extends StatefulWidget {
  late final currencyTwo;
  late final currencyVal;
  BlueCurrencyListPage({required this.currencyTwo, required this.currencyVal});

  @override
  _BlueCurrencyListPageState createState() => _BlueCurrencyListPageState();
}

class _BlueCurrencyListPageState extends State<BlueCurrencyListPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: Color(0XFF8F94FB),
          appBar: AppBar(
            backgroundColor: Color(0XFF8F94FB),
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0XFF8F94FB),
                Color(0XFF4E54C8),
              ],
            )),
            child: ListView(
              children: <Widget>[
                getListItem('Türk Lirası (₺)', 'TRY', "turkiye"),
                getListItem('Euro (€)', 'EUR', "avrupa"),
                getListItem('Amerikan Doları (\$)', 'USD', "amerika"),
                getListItem('İngiliz Sterlini (£)', 'GBP', "birlesik"),
                getListItem('Avustralya Doları (\$)', 'AUD', "avustralya"),
                getListItem('Kanada Doları (\$)', 'CAD', "kanada"),
                getListItem('Yeni Zelanda Doları (\$)', 'NZD', "yenizelanda"),
                getListItem('Japon Yeni (¥)', 'JPY', "japonya"),
                getListItem('İsviçre Frangı (CHF)', 'CHF', "isvicre"),
                getListItem('Çin Yuanı (¥)', 'CNY', "cin"),
                getListItem('Brezilya Reali (R\$)', 'BRL', "brezilya"),
                getListItem('Hindistan Rupisi (₹)', 'INR', "hindistan"),
                getListItem('Güney Kore Wonu (₩)', 'KWN', "guneykore"),
                getListItem('Meksika Pezosu (\$)', 'MXN', "meksika"),
                getListItem('Rus Rublesi (₽)', 'RUB', "rusya"),
              ],
            ),
          )),
    );
  }

  Widget getListItem(String currencyName, String currency, String image) {
    return InkWell(
      onTap: () {
        // Navigator.pop(
        //     context,
        //     DasboardPage(
        //         currencyVal: 0.0,
        //         isWhite: true,
        //         convertedCurrency: 0.0,
        //         currencyone: currency,
        //         currencytwo: widget.currencyTwo));

        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => DasboardPage(
                currencyVal: widget.currencyVal,
                isWhite: true,
                convertedCurrency: widget.currencyVal,
                currencyone: currency,
                currencytwo: widget.currencyTwo)));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/${image}.png"),
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              currencyName,
              style: kSmallTextStyle,
            ),
          ],
          // child: Text(
          //   currencyName,
          //   style: kSmallTextStyle,
          // ),
        ),
      ),
    );
  }
}
