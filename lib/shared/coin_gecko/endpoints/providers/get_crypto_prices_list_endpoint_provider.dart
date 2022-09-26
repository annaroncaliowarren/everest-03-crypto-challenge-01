import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../get_crypto_prices_list_endpoint.dart';

final getCryptoPricesListEndpointProvider = Provider<GetCryptoPricesListEndpoint>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3/',
      ),
    );
    return GetCryptoPricesListEndpoint(dio);
  },
);
