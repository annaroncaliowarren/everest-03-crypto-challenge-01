import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/coin_model.dart';
import '../repo/coin_repository.dart';

class CoinController extends StateNotifier<List<CoinModel>> {
  CoinController() : super([]) {
    getAllCoins();
  }

  Future<List<CoinModel>> getAllCoins() async {
    CoinRepository coinRepository = CoinRepository();
    state = await coinRepository.getAllCoins();
    return state;
  }
}

final coinController = StateNotifierProvider<CoinController, List<CoinModel>>(
  (ref) => CoinController(),
);

class GenerateSpotsListController extends StateNotifier<List<FlSpot>> {
  GenerateSpotsListController(List<CoinModel> coins) : super([]) {
    generateSpotsList(coins);
  }

  List<String> listValue = [];

  Future<List<FlSpot>> generateSpotsList(List<CoinModel> coins) async {
    Decimal? yValue;

    state = List.generate(
      90,
      (index) {
        if (index == 0) {
          for (CoinModel coin in coins) {
            if (coin.base == 'BTC') {
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

final spotsController = StateNotifierProvider<GenerateSpotsListController, List<FlSpot>>(
  (ref) => GenerateSpotsListController(ref.watch(coinController)),
);
