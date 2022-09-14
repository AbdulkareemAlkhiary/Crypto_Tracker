import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const coinURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'BC67729A-ACB1-4026-B606-9AFB4186385F';

class CoinData {
  Future getCoinData(String selectedCurrency, String crypto) async {
    String requestURL = '$coinURL/$crypto/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
