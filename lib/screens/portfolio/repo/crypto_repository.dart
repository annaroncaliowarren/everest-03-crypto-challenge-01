import 'package:decimal/decimal.dart';

import '../../../shared/utils/app_assets.dart';
import '../model/crypto_model.dart';

class CryptoRepository {
  
  List<CryptoModel> getAllCryptos() {
    List<CryptoModel> cryptosList = [
      CryptoModel(
        shortName: 'BTC',
        fullName: 'Bitcoin',
        cryptoIcon: AppAssets().iconBitcoin,
        currencyCustomerValue: Decimal.parse('6577'),
        amountCurrency: 0,
      ),
      CryptoModel(
        shortName: 'ETH',
        fullName: 'Ethereum',
        cryptoIcon: AppAssets().iconEthereum,
        currencyCustomerValue: Decimal.parse('7996'),
        amountCurrency: 0,
      ),
      CryptoModel(
        shortName: 'LTC',
        fullName: 'Litecoin',
        cryptoIcon: AppAssets().iconLitecoin,
        currencyCustomerValue: Decimal.parse('245'),
        amountCurrency: 0,
      ),
    ];

    return cryptosList;
  }
}
