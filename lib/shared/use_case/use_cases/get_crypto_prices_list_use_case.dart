import '../../repository/get_crypto_prices_list_repository.dart';
import '../mapper/crypto_prices_list_mapper.dart';
import '../view_data/crypto_prices_list_view_data.dart';

class GetCryptoPricesListUseCase {
  final GetCryptoPricesListRepository repository;

  GetCryptoPricesListUseCase({
    required this.repository,
  });

  Future<CryptoPricesListViewData> execute(String cryptoFullName) async {
    final response = await repository.getCryptoPricesList(cryptoFullName);
    return response.toViewData();
  }
}
