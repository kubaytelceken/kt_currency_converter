import 'dart:ffi';

import 'package:currency_converter/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '21259ff2b7e13dc6a029ff7d8c40e410';
const openWeatherMapURL = 'https://open.er-api.com/v6/latest';

class CurrencyService {
  getCurrencyString(currency) {
    if (currency == 'TRY') return 'Türk Lirası';
    if (currency == 'AUD') return 'Avustralya Doları';
    if (currency == 'CAD') return 'Kanada Doları';
    if (currency == 'NZD') return 'Yeni Zelanda Doları';
    if (currency == 'JPY') return 'Japon Yeni';
    if (currency == 'CHF') return 'İsviçre Frangı';
    if (currency == 'GBP') return 'İngiliz Sterlini';
    if (currency == 'EUR') return 'Euro';
    if (currency == 'USD') return 'Amerikan Doları';
    if (currency == 'CNY') return 'Çin Yuanı';
    if (currency == 'BRL') return 'Brezilya Reali';
    if (currency == 'INR') return 'Hindistan Rupisi';
    if (currency == 'KWN') return 'Güney Kore Wonu';
    if (currency == 'MXN') return 'Meksika Pezosu';
    if (currency == 'RUB') return 'Rus Rublesi';
  }

  Future<dynamic> getCurrencyData(String currencyOne) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherMapURL/$currencyOne');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }
}
