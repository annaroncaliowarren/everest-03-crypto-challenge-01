import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_assets.dart';
import 'container_top_wallet_screen.dart';
import 'list_tile_crypto.dart';

class BodyWalletScreen extends StatefulWidget {
  const BodyWalletScreen({Key? key}) : super(key: key);

  @override
  State<BodyWalletScreen> createState() => _BodyWalletScreenState();
}

class _BodyWalletScreenState extends State<BodyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContainerTopWalletScreen(),
        Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              const ListTileCrypto(),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(AppAssets().iconEthereum),
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
                          //isVisible ?
                          UtilBrasilFields.obterReal(7996),
                          // : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // isVisible ?
                          '0.94 ETH', // : '•••• ETH',
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
                  child: Image.asset(AppAssets().iconLitecoin),
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
                          //isVisible
                          UtilBrasilFields.obterReal(245),
                          //   : 'R\$ •••••',
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            color: const Color.fromRGBO(47, 47, 51, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          //isVisible ?
                          '0.82 LTC', // : '•••• LTC',
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

