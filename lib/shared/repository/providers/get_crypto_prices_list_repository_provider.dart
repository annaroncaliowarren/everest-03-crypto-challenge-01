import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../coin_gecko/endpoints/providers/get_crypto_prices_list_endpoint_provider.dart';
import '../get_crypto_prices_list_repository.dart';

final getCryptoPricesListRepositoryProvider = Provider<GetCryptoPricesListRepository>(
  (ref) => GetCryptoPricesListRepository(
    endpoint: ref.read(getCryptoPricesListEndpointProvider),
  ),
);
