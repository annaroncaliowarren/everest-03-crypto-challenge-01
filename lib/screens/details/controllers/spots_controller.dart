import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_model.dart';

class GenerateSpotsListController extends StateNotifier<List<FlSpot>> {
  GenerateSpotsListController() : super([]);

  List<String> listValue = [];

  Future<List<FlSpot>> generateSpotsList(CryptoModel crypto) async {
    Decimal? yValue;

    state = List.generate(
      90,
      (index) {
        if (index == 0) {
          yValue = crypto.currentPrice;
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
