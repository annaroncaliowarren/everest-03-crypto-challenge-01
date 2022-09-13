import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        right: 10,
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
                  color: const Color.fromRGBO(224, 43, 87, 1),
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
              color: const Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
        ],
      ),
    );
  }
}

