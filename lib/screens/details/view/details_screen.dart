import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/details_provider.dart';
import '../widgets/line_chart_details_screen.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceController = ref.watch(priceProvider.state);
    final valueVariation = ref.watch(valueVariationProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Bitcoin',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'BTC',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      child: Image.asset('assets/icons/bitcoin_icon.png'),
                    ),
                  ],
                ),
              ),
              Text(
                UtilBrasilFields.obterReal(
                  priceController.state.toDouble(),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 30,
                ),
                child: LineChartDetailsScreen(),
              ),
              ListTile(
                title: Text(
                  'Preço atual',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 19,
                  ),
                ),
                trailing: Text(
                  UtilBrasilFields.obterReal(
                    priceController.state.toDouble(),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Variação 24H',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 19,
                  ),
                ),
                trailing: Text(
                  valueVariation.state <= 0
                      ? '${valueVariation.state.toStringAsFixed(2)}%'
                      : '+${valueVariation.state.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: valueVariation.state < 0 ? Colors.red : Colors.green,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Quantidade',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 19,
                  ),
                ),
                trailing: const Text(
                  '0,65554321 BTC',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Valor',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 19,
                  ),
                ),
                trailing: const Text(
                  'R\$ 6.557,00',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: MaterialButton(
                  onPressed: () {},
                  height: 56,
                  minWidth: MediaQuery.of(context).size.width,
                  color: const Color.fromRGBO(224, 43, 87, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Converter moeda',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
