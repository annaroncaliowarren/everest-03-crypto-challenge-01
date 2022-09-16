import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/app_assets.dart';
import 'total_customer_currency.dart';
import 'visibility_icon_button.dart';

class ContainerTopWalletScreen extends StatelessWidget {
  const ContainerTopWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 25,
        right: 18,
        left: 16,
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
              const SizedBox(height: 8),
              const VisibilityIconButton(),
            ],
          ),
          const TotalCurrencyCustomer(),
          Text(
            'Valor total de moedas',
            style: GoogleFonts.nunito(
              fontSize: 17,
              color:  AppAssets().colorGrey,
            ),
          ),
        ],
      ),
    );
  }
}

