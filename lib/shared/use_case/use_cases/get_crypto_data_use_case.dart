import '../../repository/crypto_repository.dart';
import '../mapper/crypto_mapper.dart';
import '../view_data/crypto_list_view_data.dart';

class GetCryptoDataUseCase {
  final CryptoRepository repository;

  GetCryptoDataUseCase({
    required this.repository,
  });

  Future<CryptoListViewData> execute() async {
    final response = await repository.getAllCryptoCoins();
    return response.toViewData();
  }
}