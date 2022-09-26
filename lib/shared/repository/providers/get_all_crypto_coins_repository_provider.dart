import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../coin_gecko/endpoints/providers/get_all_crypto_coins_endpoint_provider.dart';
import '../get_all_crypto_coins_repository.dart';

final getAllCryptoCoinsRepositoryProvider = Provider(
  (ref) => GetAllCryptoCoinsRepository(
    cryptoEndpoint: ref.read(getAllCryptoCoinsEndpointProvider),
  ),
);
