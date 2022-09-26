import 'package:decimal/decimal.dart';

import '../coin_gecko/endpoint/crypto_endpoint.dart';
import '../coin_gecko/models/crypto_prices_list_response.dart';
import '../coin_gecko/models/crypto_response.dart';

class CryptoRepository {
  final CryptoEndpoint cryptoEndpoint;

  CryptoRepository({
    required this.cryptoEndpoint,
  });

  Future<List<CryptoResponse>> getAllCryptoCoins() async {
    final response = await cryptoEndpoint.getAllCryptoCoins();
    return List<CryptoResponse>.from(
      response.data.map(
        (coin) => CryptoResponse.fromJson(coin),
      ),
    );
  }

  Future<CryptoPricesListResponse> getListPricesCryptoCoin(
      String cryptoFullName) async {
    final response =
        await cryptoEndpoint.getListPricesCryptoCoin(cryptoFullName);

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
