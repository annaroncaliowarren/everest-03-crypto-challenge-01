import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/crypto_repository_provider.dart';
import '../use_cases/get_crypto_prices_list_use_case.dart';
import '../view_data/crypto_prices_list_view_data.dart';

final getCryptoPricesListUseCaseProvider = Provider(
  (ref) {
    return GetCryptoPricesListUseCase(
      repository: ref.read(cryptoRepositoryProvider),
    );
  },
);

final cryptoPricesListProvider =
    FutureProvider.family<CryptoPricesListViewData, String>(
  (ref, cryptoFullName) async {
    return ref.read(getCryptoPricesListUseCaseProvider).execute(cryptoFullName);
  },
);
