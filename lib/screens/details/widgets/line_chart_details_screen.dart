import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/utils/app_assets.dart';
import '../../portfolio/model/crypto_model.dart';
import '../controllers/coin_controller.dart';
import '../controllers/spots_controller.dart';
import '../model/coin_model.dart';
import '../provider/details_provider.dart';

class LineChartDetailsScreen extends ConsumerStatefulWidget {
  final CryptoModel model;

  const LineChartDetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<LineChartDetailsScreen> createState() =>
      _LineChartDetailsScreen();
}

class _LineChartDetailsScreen extends ConsumerState<LineChartDetailsScreen> {
  int selectedIndex = 0;
  List<int> days = [5, 15, 30, 45, 90];
  List<FlSpot> daysSpotsList = [];

  @override
  Widget build(BuildContext context) {
    final coins = ref.watch(coinController);
    final spotsList = ref.watch(spotsController);
    final valueVariation = ref.watch(valueVariationProvider.state);
    final listPrices = ref.watch(spotsController.notifier).listValue;

    getVariationValue(Decimal priceSelected) {
      int indexPrice = listPrices.indexOf(priceSelected.toStringAsFixed(2));

      if (indexPrice != 0) {
        valueVariation.state = ((priceSelected.toDouble() /
                    double.parse(listPrices[indexPrice - 1])) -
                1) *
            100;
      } else {
        valueVariation.state = 0;
      }
    }

    return AspectRatio(
      aspectRatio: 2.4,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
              Decimal? selectedPrice;

              if (event.isInterestedForInteractions ||
                  lineTouch == null ||
                  lineTouch.lineBarSpots == null) {
                for (CoinModel coin in coins) {
                  if (coin.base == widget.model.shortName) {
                    ref.read(priceProvider.state).state =
                        Decimal.parse(coin.prices.latest);
                    valueVariation.state = 0;
                  }
                }
                return;
              } else {
                selectedPrice =
                    ref.read(priceProvider.state).state = Decimal.parse(
                  lineTouch.lineBarSpots![0].y.toString(),
                );
                getVariationValue(selectedPrice);
              }
            },
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> indicators) {
              return indicators.map(
                (int index) {
                  final line = FlLine(
                    color: Colors.pink,
                    strokeWidth: 1,
                    dashArray: [2, 4],
                  );
                  return TouchedSpotIndicatorData(
                    line,
                    FlDotData(show: true),
                  );
                },
              ).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              showOnTopOfTheChartBoxArea: true,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: daysSpotsList,
              isCurved: false,
              barWidth: 3,
              color: const Color.fromRGBO(224, 43, 87, 1),
              dotData: FlDotData(show: false),
            ),
          ],
          minY: 0,
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 40,
              axisNameWidget: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 15),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      daysSpotsList = spotsList.sublist(90 - days[index]);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: const Size(29, 22),
                      backgroundColor: selectedIndex == index
                          ? const Color.fromRGBO(227, 228, 235, 1)
                          : Colors.transparent,
                    ),
                    child: Text(
                      '${days[index]}D',
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: selectedIndex == index
                            ? AppAssets().colorBlack
                            : AppAssets().colorGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }
}
