import '../model/crypto_model.dart';
import '../repo/crypto_repository.dart';

class CryptoUseCase {
  final CryptoRepository repository = CryptoRepository();

  List<CryptoModel> getAllCryptos() {
    return repository.getAllCryptos();
  }
}
