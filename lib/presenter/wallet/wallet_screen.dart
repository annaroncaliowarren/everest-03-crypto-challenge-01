import 'package:crypto_list/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        size: 22,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isVisible,
                  replacement: const Text('US\$ ******'),
                  child: Text(
                    'US\$ 1.000,00',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                      color: const Color.fromRGBO(47, 47, 51, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 9,
            children: [
              ListTile(
                leading: Image.asset(iconEthereum),
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
                title: Text(
                  'ETH',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
                subtitle: Text(
                  'Ethereum',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    color: const Color.fromRGBO(117, 118, 128, 1),
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(
                      'US\$ 0,00',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 20,
                        color: const Color.fromRGBO(47, 47, 51, 1),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(160, 244, 224, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '+75%',
                        style: GoogleFonts.sourceSansPro(
                          color: const Color.fromRGBO(12, 95, 44, 1),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
