import 'package:currency_converter/dashboardPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueCurrencyListPage extends StatefulWidget {
  late final currencyTwo;
  BlueCurrencyListPage({required this.currencyTwo});

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
          body: ListView(
            children: <Widget>[
              getListItem('Türk Lirası', 'TRY'),
              getListItem('Avustralya Doları', 'AUD'),
              getListItem('Kanada Doları', 'CAD'),
              getListItem('Yeni Zelanda Doları', 'NZD'),
              getListItem('Japon Yeni', 'JPY'),
              getListItem('İsviçre Frangı', 'CHF'),
              getListItem('İngiliz Sterlini', 'GBP'),
              getListItem('Euro', 'EUR'),
              getListItem('Amerikan Doları', 'USD'),
              getListItem('Çin Yuanı', 'CNY'),
              getListItem('Brezilya Reali', 'BRL'),
              getListItem('Hindistan Rupisi', 'INR'),
              getListItem('Güney Kore Wonu', 'KWN'),
              getListItem('Meksika Pezosu', 'MXN'),
              getListItem('Rus Rublesi', 'RUB'),
            ],
          )),
    );
  }

  Widget getListItem(String currencyName, String currency) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => DasboardPage(
                currencyVal: 0.0,
                isWhite: true,
                convertedCurrency: 0.0,
                currencyone: currency,
                currencytwo: widget.currencyTwo)));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Text(
          currencyName,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
