import 'package:decimal/decimal.dart';

import '../coin_gecko/endpoints/crypto_endpoints.dart';
import '../coin_gecko/models/crypto_prices_list_response.dart';

class GetCryptoPricesListRepository {
  final CryptoEndpoints cryptoEndpoint;

  GetCryptoPricesListRepository({
    required this.cryptoEndpoint,
  });

  Future<CryptoPricesListResponse> getCryptoPricesList(
      String cryptoFullName) async {
    final response = await cryptoEndpoint.getCryptoPricesList(cryptoFullName);

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
