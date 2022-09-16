import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_model.dart';
import '../usecase/crypto_usecase.dart';

class CryptoController extends StateNotifier<List<CryptoModel>> {
  CryptoController() : super([]) {
    getAllCryptos();
  }

  final cryptoUseCase = CryptoUseCase();

  List<CryptoModel> getAllCryptos() {
    state = cryptoUseCase.getAllCryptos();
    return state;
  }
}

final cryptoController = StateNotifierProvider<CryptoController, List<CryptoModel>>(
  (ref) => CryptoController(),
);
