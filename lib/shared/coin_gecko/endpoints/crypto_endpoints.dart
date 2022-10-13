import 'package:dio/dio.dart';

class CryptoEndpoints {
  final Dio _dio;

  CryptoEndpoints(this._dio);

  Future<Response> getAllCryptoCoins() async {
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
      },
    );
  }

  Future<Response> getCryptoPricesList(String cryptoId) async {
    return _dio.get(
      '/coins/$cryptoId/market_chart',
      queryParameters: {
        'vs_currency': 'brl',
        'days': '89',
        'interval': 'daily',
      },
    );
  }
}
