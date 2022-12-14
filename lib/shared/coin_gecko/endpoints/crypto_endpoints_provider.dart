import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_endpoints.dart';

final cryptoEndpointsProvider = Provider<CryptoEndpoints>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3/',
      ),
    );
    return CryptoEndpoints(dio);
  },
);
