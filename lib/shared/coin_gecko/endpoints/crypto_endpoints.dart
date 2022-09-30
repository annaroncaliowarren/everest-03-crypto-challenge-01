import 'package:dio/dio.dart';

class CryptoEndpoints {
  final Dio _dio;

  CryptoEndpoints(this._dio);

  Future<Response> getAllCryptoCoins() async {
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': 'bitcoin,ethereum,litecoin,dogecoin,cardano,tether',
      },
    );
  }

  Future<Response> getCryptoPricesList(String cryptoFullName) async {
    return _dio.get(
      '/coins/${cryptoFullName.toLowerCase()}/market_chart',
      queryParameters: {
        'vs_currency': 'brl',
        'days': '89',
        'interval': 'daily',
      },
    );
  }
}
