import 'package:dio/dio.dart';

import '../model/coin_model.dart';

class CoinRepository {
  Future<List<CoinModel>> getAllCoins() async {
    Dio dio = Dio();

    final response =
        await dio.get('https://api.coinbase.com/v2/assets/prices?base=BRL');

    return List.from(
      response.data['data'].map(
        (model) => CoinModel.fromMap(model),
      ),
    );
  }
}
