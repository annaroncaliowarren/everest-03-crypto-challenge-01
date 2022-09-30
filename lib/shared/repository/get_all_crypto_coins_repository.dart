import '../coin_gecko/endpoints/crypto_endpoints.dart';
import '../coin_gecko/models/crypto_response.dart';

class GetAllCryptoCoinsRepository {
  final CryptoEndpoints cryptoEndpoint;

  GetAllCryptoCoinsRepository({
    required this.cryptoEndpoint,
  });

  Future<List<CryptoResponse>> getAllCryptoCoins() async {
    final response = await cryptoEndpoint.getAllCryptoCoins();
    return List<CryptoResponse>.from(
      response.data.map(
        (coin) => CryptoResponse.fromMap(coin),
      ),
    );
  }
}
