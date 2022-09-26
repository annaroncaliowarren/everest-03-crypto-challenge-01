import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../coin_gecko/endpoints/crypto_endpoints_provider.dart';
import '../get_all_crypto_coins_repository.dart';

final getAllCryptoCoinsRepositoryProvider = Provider<GetAllCryptoCoinsRepository>(
  (ref) => GetAllCryptoCoinsRepository(
    cryptoEndpoint: ref.read(cryptoEndpointsProvider),
  ),
);
