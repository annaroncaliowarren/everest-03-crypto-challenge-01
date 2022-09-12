import 'package:crypto_list/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: BodyWalletScreen(),
      ),
    );
  }
}

class BodyWalletScreen extends StatefulWidget {
  const BodyWalletScreen({Key? key}) : super(key: key);

  @override
  State<BodyWalletScreen> createState() => _BodyWalletScreenState();
}

class _BodyWalletScreenState extends State<BodyWalletScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 31,
            bottom: 25,
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
                    'Cripto',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                      color: const Color.fromRGBO(224, 43, 87, 1),
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
                replacement: Text(
                  'R\$ •••••',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
                child: Text(
                  'R\$ 14.798,00',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
              ),
              Text(
                'Valor total de moedas',
                style: GoogleFonts.nunito(
                  fontSize: 17,
                  color: const Color.fromRGBO(117, 118, 128, 1),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.67,
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromRGBO(247, 147, 26, 1),
                  child: Image.asset(iconBitcoin),
                ),
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                title: Text(
                  'BTC',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 19,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
                subtitle: Text(
                  'Bitcoin',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    color: const Color.fromRGBO(117, 118, 128, 1),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          isVisible ? 'R\$ 6.557,00' : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '0.65 BTC',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: const Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
