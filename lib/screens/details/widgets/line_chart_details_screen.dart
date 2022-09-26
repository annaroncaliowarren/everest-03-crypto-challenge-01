import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/use_case/view_data/crypto_prices_list_view_data.dart';
import '../../../shared/use_case/view_data/crypto_view_data.dart';
import '../../../shared/utils/app_assets.dart';
import '../provider/details_provider.dart';

class LineChartDetailsScreen extends ConsumerStatefulWidget {
  final CryptoPricesListViewData listPricesCrypto;
  final CryptoViewData crypto;

  const LineChartDetailsScreen({
    Key? key,
    required this.listPricesCrypto,
    required this.crypto,
  }) : super(key: key);

  @override
  ConsumerState<LineChartDetailsScreen> createState() =>
      _LineChartDetailsScreen();
}

class _LineChartDetailsScreen extends ConsumerState<LineChartDetailsScreen> {
  int selectedIndex = 0;
  List<int> days = [5, 15, 30, 45, 90];
  List<FlSpot> spotsList = [];

  List<FlSpot> generateSpotsList() {
    for (int i = 0; i < widget.listPricesCrypto.listPrices.length; i++) {
      spotsList.add(
        FlSpot(
          i.toDouble(),
          widget.listPricesCrypto.listPrices[i].toDouble(),
        ),
      );
    }
    return spotsList;
  }

  @override
  void initState() {
    generateSpotsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 30,
      ),
      child: AspectRatio(
        aspectRatio: 2.4,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              touchCallback:
                  (FlTouchEvent event, LineTouchResponse? lineTouch) {
                if (!event.isInterestedForInteractions ||
                    lineTouch == null ||
                    lineTouch.lineBarSpots == null) {
                  ref.read(priceProvider.state).state =
                      widget.crypto.currentPrice;
                } else {
                  ref.read(priceProvider.state).state = Decimal.parse(
                    lineTouch.lineBarSpots![0].y.toString(),
                  );
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
                getTooltipItems: (touchedSpots) {
                  List<LineTooltipItem> prices = [];
                  for (LineBarSpot spot in touchedSpots) {
                    prices.add(
                      LineTooltipItem(
                        UtilBrasilFields.obterReal(spot.y),
                        const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }
                  return prices;
                },
                tooltipBgColor: Colors.transparent,
                showOnTopOfTheChartBoxArea: true,
                fitInsideHorizontally: true,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spotsList.sublist(
                  widget.listPricesCrypto.listPrices.length -
                      days[selectedIndex],
                ),
                isCurved: false,
                barWidth: 3,
                color: const Color.fromRGBO(224, 43, 87, 1),
                dotData: FlDotData(show: false),
              ),
            ],
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
      ),
    );
  }
}
