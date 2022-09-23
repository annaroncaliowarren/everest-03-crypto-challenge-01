import 'package:dio/dio.dart';

class CryptoEndpoint {
  final Dio _dio;

  CryptoEndpoint(this._dio);

  Future<Response> getAllCryptoCoins() async {
    return _dio.get(
      'https://api.coingecko.com/api/v3/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': 'bitcoin,ethereum,litecoin,dogecoin',
      },
    );
  }

  Future<Response> getListPricesCryptoCoin(String cryptoFullName) async {
    return _dio.get(
      'https://api.coingecko.com/api/v3/coins/${cryptoFullName.toLowerCase()}/market_chart',
      queryParameters: {
        'vs_currency': 'brl',
        'days': '89',
        'interval': 'daily',
      },
    );
  }
}
