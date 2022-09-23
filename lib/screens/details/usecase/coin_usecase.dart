
import '../model/coin_model.dart';
import '../repo/coin_repository.dart';

class CoinUseCase {
  
  final CoinRepository coinRepository = CoinRepository();

  Future<List<CoinModel>> getAllCoins() async {
    return coinRepository.getAllCoins();
  }
}