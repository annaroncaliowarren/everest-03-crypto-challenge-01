import '../../coin_gecko/models/crypto_prices_list_response.dart';
import '../view_data/crypto_prices_list_view_data.dart';

extension CryptoPricesListMapper on CryptoPricesListResponse {
  CryptoPricesListViewData toViewData() {
    return CryptoPricesListViewData(listPrices: listPrices);
  }
}
