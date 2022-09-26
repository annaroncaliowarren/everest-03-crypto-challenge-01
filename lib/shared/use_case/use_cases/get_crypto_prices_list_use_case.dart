import '../../repository/crypto_repository.dart';
import '../mapper/crypto_prices_list_mapper.dart';
import '../view_data/crypto_prices_list_view_data.dart';

class GetCryptoPricesListUseCase {
  final CryptoRepository repository;

  GetCryptoPricesListUseCase({
    required this.repository,
  });

  Future<CryptoPricesListViewData> execute(String cryptoFullName) async {
    final response = await repository.getListPricesCryptoCoin(cryptoFullName);
    return response.toViewData();
  }
}
