import 'dart:math';

import 'package:crypto_list/screens/details/usecase/coin_usecase.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_model.dart';
import '../model/coin_model.dart';

class CoinController extends StateNotifier<List<CoinModel>> {
  CoinController() : super([]) {
    getAllCoins();
  }

  Future<List<CoinModel>> getAllCoins() async {
    CoinUseCase coinUseCase = CoinUseCase();
    state = await coinUseCase.getAllCoins();
    return state;
  }
}

final coinController = StateNotifierProvider<CoinController, List<CoinModel>>(
  (ref) => CoinController(),
);

class GenerateSpotsListController extends StateNotifier<List<FlSpot>> {
  GenerateSpotsListController() : super([]);

  List<String> listValue = [];

  Future<List<FlSpot>> generateSpotsList(List<CoinModel> coins, CryptoModel crypto) async {
    Decimal? yValue;

    state = List.generate(
      90,
      (index) {
        if (index == 0) {
          for (CoinModel coin in coins) {
            if (crypto.shortName == coin.base) {
              yValue = Decimal.parse(coin.prices.latest);
              listValue.add(yValue!.toStringAsFixed(2));
            }
          }
        } else {
          yValue = yValue! +
              (Random().nextBool()
                  ? yValue! *
                      Decimal.parse(
                        (Random().nextDouble() * 0.05).toString(),
                      )
                  : -(yValue! *
                      Decimal.parse(
                        (Random().nextDouble() * 0.05).toString(),
                      )));

          listValue.add(yValue!.toStringAsFixed(2));
        }

        return FlSpot(
          index.toDouble(),
          double.parse(yValue!.toStringAsFixed(2)),
        );
      },
    );

    return state;
  }
}

final spotsController =
    StateNotifierProvider<GenerateSpotsListController, List<FlSpot>>(
  (ref) => GenerateSpotsListController(),
);
