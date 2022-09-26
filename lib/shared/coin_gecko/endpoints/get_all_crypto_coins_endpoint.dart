import 'package:dio/dio.dart';

class GetAllCryptoCoinsEndpoint {
  final Dio _dio;

  GetAllCryptoCoinsEndpoint(this._dio);

  Future<Response> getAllCryptoCoins() async {
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': 'bitcoin,ethereum,litecoin,dogecoin',
      },
    );
  }
}
