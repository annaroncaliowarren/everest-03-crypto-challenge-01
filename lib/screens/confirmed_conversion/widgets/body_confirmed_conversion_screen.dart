import 'package:crypto_list/shared/utils/app_assets.dart';
import 'package:flutter/material.dart';

class BodyConfirmedConversionScreen extends StatelessWidget {
  const BodyConfirmedConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets().imageCheck,
          ),
          const SizedBox(height: 16),
          const Text(
            'Conversão efetuada',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Conversão de moeda efetuada com sucesso!',
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
        ],
      ),
    );
  }
}
