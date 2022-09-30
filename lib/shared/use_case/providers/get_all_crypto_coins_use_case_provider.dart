import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/providers/get_all_crypto_coins_repository_provider.dart';
import '../use_cases/get_all_crypto_coins_use_case.dart';
import '../view_data/crypto_list_view_data.dart';

final getAllCryptoCoinsUseCaseProvider = Provider<GetAllCryptoCoinsUseCase>(
  (ref) {
    return GetAllCryptoCoinsUseCase(
      repository: ref.read(getAllCryptoCoinsRepositoryProvider),
    );
  },
);

final getAllCryptoCoinsProvider = FutureProvider<CryptoListViewData>(
  (ref) async {
    return ref.read(getAllCryptoCoinsUseCaseProvider).execute();
  },
);
