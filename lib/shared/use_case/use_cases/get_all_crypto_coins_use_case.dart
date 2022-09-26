import '../../repository/get_all_crypto_coins_repository.dart';
import '../mapper/crypto_mapper.dart';
import '../view_data/crypto_list_view_data.dart';

class GetAllCryptoCoinsUseCase {
  final GetAllCryptoCoinsRepository repository;

  GetAllCryptoCoinsUseCase({
    required this.repository,
  });

  Future<CryptoListViewData> execute() async {
    final response = await repository.getAllCryptoCoins();
    return response.toViewData();
  }
}