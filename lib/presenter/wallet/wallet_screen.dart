import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 31,
          bottom: 66,
          right: 15,
          left: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Carteira',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    size: 22,
                  ),
                ),
              ],
            ),
            Text(
              'US\$ 1.000,00',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
                color: const Color.fromRGBO(47, 47, 51, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
