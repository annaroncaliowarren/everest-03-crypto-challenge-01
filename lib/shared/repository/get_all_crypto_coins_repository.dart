import '../coin_gecko/endpoints/get_all_crypto_coins_endpoint.dart';
import '../coin_gecko/models/crypto_response.dart';

class GetAllCryptoCoinsRepository {
  final GetAllCryptoCoinsEndpoint cryptoEndpoint;

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
