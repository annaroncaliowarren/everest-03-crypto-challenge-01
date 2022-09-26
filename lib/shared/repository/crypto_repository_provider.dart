import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../coin_gecko/endpoint/crypto_endpoint_provider.dart';
import 'crypto_repository.dart';

final cryptoRepositoryProvider = Provider(
  (ref) => CryptoRepository(
    cryptoEndpoint: ref.read(cryptoEndpointProvider),
  ),
);
