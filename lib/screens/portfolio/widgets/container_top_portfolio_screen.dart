import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/app_assets.dart';
import 'total_customer_currency.dart';
import 'visibility_icon_button.dart';

class ContainerTopPortfolioScreen extends StatelessWidget {
  const ContainerTopPortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 17,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cripto',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                  color: AppAssets().colorPink,
                ),
              ),
              const VisibilityIconButton(),
            ],
          ),
          const SizedBox(height: 8),
          const TotalCurrencyCustomer(),
          Text(
            'Valor total de moedas',
            style: TextStyle(
              fontSize: 17,
              color: AppAssets().colorGrey,
            ),
          ),
        ],
      ),
    );
  }
}
