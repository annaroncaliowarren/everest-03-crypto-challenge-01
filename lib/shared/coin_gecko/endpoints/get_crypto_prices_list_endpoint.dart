import 'package:dio/dio.dart';

class GetCryptoPricesListEndpoint {
  final Dio _dio;

  GetCryptoPricesListEndpoint(this._dio);

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
