import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../get_all_crypto_coins_endpoint.dart';

final getAllCryptoCoinsEndpointProvider = Provider<GetAllCryptoCoinsEndpoint>(
  (ref) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3/',
      ),
    );
    return GetAllCryptoCoinsEndpoint(dio);
  },
);
