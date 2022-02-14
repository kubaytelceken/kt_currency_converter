import 'package:flutter/material.dart';

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
}
