import 'package:brasil_fields/brasil_fields.dart';
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
            top: 30,
            bottom: 25,
            right: 10,
            left: 16,
          ),
          //padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    padding: EdgeInsets.zero,
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
                  UtilBrasilFields.obterReal(14798),
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
        Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
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
                  vertical: 5,
                ),
                horizontalTitleGap: 8,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isVisible
                              ? UtilBrasilFields.obterReal(6577)
                              : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isVisible ? '0.65 BTC' : '•••• BTC',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: const Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 5,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(iconEthereum),
                ),
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                horizontalTitleGap: 8,
                title: Text(
                  'ETH',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 19,
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isVisible
                              ? UtilBrasilFields.obterReal(7996)
                              : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isVisible ? '0.94 ETH' : '•••• ETH',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: const Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 5,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(iconLitecoin),
                ),
                shape: const Border(
                  top: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                horizontalTitleGap: 8,
                title: Text(
                  'LTC',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 19,
                    color: const Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
                subtitle: Text(
                  'Litecoin',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    color: const Color.fromRGBO(117, 118, 128, 1),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isVisible
                              ? UtilBrasilFields.obterReal(245)
                              : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isVisible ? '0.82 LTC' : '•••• LTC',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: const Color.fromRGBO(117, 118, 128, 1),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 5,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: Color.fromRGBO(117, 118, 128, 1),
                        ),
                      ),
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
