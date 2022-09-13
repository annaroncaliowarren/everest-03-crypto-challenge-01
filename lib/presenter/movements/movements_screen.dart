import '../../core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyMovementsScreen(),
    );
  }
}

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
