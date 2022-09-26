import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/crypto_repository_provider.dart';
import '../use_cases/get_crypto_data_use_case.dart';
import '../view_data/crypto_list_view_data.dart';

final getCryptoDataUseCaseProvider = Provider(
  (ref) {
    return GetCryptoDataUseCase(
      repository: ref.read(cryptoRepositoryProvider),
    );
  },
);

final cryptoDataProvider = FutureProvider<CryptoListViewData>(
  (ref) async {
    return ref.read(getCryptoDataUseCaseProvider).execute();
  },
);
