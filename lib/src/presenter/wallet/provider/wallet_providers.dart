import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_model.dart';
import '../usecase/crypto_usecase.dart';

final isVisibleProvider = StateProvider<bool>((ref) => true);

class CryptoNotifier extends StateNotifier<List<CryptoModel>> {
  CryptoNotifier() : super([]) {
    getAllCryptos();
  }

  CryptoUseCase useCase = CryptoUseCase();

  List<CryptoModel> getAllCryptos() {
    state = useCase.getAllCryptos();
    return state;
  }
}

final cryptoNotifier = StateNotifierProvider<CryptoNotifier, List<CryptoModel>>(
  (ref) => CryptoNotifier(),
);
