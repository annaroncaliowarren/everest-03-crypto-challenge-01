import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_endpoint.dart';

final cryptoEndpointProvider = Provider(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3/',
      ),
    );
    return CryptoEndpoint(dio);
  },
);
