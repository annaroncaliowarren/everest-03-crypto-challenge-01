import 'package:decimal/decimal.dart';

import '../coin_gecko/endpoints/get_crypto_prices_list_endpoint.dart';
import '../coin_gecko/models/crypto_prices_list_response.dart';

class GetCryptoPricesListRepository {
  final GetCryptoPricesListEndpoint endpoint;

  GetCryptoPricesListRepository({
    required this.endpoint,
  });

  Future<CryptoPricesListResponse> getCryptoPricesList(
      String cryptoFullName) async {
    final response = await endpoint.getCryptoPricesList(cryptoFullName);

    List<Decimal> listPricesCrypto = response.data['prices']
        .map<Decimal>(
          (price) => Decimal.parse('${price[1]}'),
        )
        .toList();

    Map<String, List<Decimal>> mapPrices = {
      'listPrices': listPricesCrypto,
    };

    return CryptoPricesListResponse.fromJson(mapPrices);
  }
}
