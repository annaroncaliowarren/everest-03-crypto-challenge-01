import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/coin_model.dart';
import '../usecase/coin_usecase.dart';

class CoinController extends StateNotifier<List<CoinModel>> {
  CoinController() : super([]) {
    getAllCoins();
  }

  Future<List<CoinModel>> getAllCoins() async {
    CoinUseCase coinUseCase = CoinUseCase();
    state = await coinUseCase.getAllCoins();
    return state;
  }
}

final coinController = StateNotifierProvider<CoinController, List<CoinModel>>(
  (ref) => CoinController(),
);

