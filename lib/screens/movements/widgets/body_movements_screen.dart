import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/app_assets.dart';

class BodyMovementsScreen extends StatelessWidget {
  const BodyMovementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets().imageWorkInProgress,
            scale: 3,
          ),
          const SizedBox(height: 20),
          Text(
            'Em breve!',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 45,
              color: const Color.fromRGBO(224, 43, 87, 1),
            ),
          ),
        ],
      ),
    );
  }
}
