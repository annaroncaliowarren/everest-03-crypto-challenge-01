import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/providers/get_crypto_prices_list_repository_provider.dart';
import '../use_cases/get_crypto_prices_list_use_case.dart';
import '../view_data/crypto_prices_list_view_data.dart';

final getCryptoPricesListUseCaseProvider = Provider<GetCryptoPricesListUseCase>(
  (ref) {
    return GetCryptoPricesListUseCase(
      repository: ref.read(getCryptoPricesListRepositoryProvider),
    );
  },
);

final getCryptoPricesListProvider =
    FutureProvider.family<CryptoPricesListViewData, String>(
  (ref, cryptoId) async {
    return ref.read(getCryptoPricesListUseCaseProvider).execute(cryptoId);
  },
);
