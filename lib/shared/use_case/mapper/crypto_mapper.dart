import '../../coin_gecko/models/crypto_response.dart';
import '../view_data/crypto_list_view_data.dart';
import '../view_data/crypto_view_data.dart';

extension CryptoMapper on List<CryptoResponse> {
  CryptoListViewData toViewData() {
    return CryptoListViewData(
      listCryptoViewData: map(
        (coin) {
          return CryptoViewData(
            id: coin.id,
            symbol: coin.symbol,
            name: coin.name,
            image: coin.image,
            currentPrice: coin.currentPrice,
            priceChangePercentage24h: coin.priceChangePercentage24h,
          );
        },
      ).toList(),
    );
  }
}