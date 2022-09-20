import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../screens/portfolio/view/portfolio_screen.dart';
import '../../screens/transactions/view/transactions_screen.dart';
import '../providers/index_provider.dart';
import '../utils/app_assets.dart';

class BottomNavigationBarApp extends HookConsumerWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageSelectedIndex = ref.watch(selectedIndexProvider.state);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets().iconWarrenOutlined),
          activeIcon: Image.asset(AppAssets().iconWarren),
          label: 'Portfólio',
          tooltip: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets().iconCryptoOutlined),
          activeIcon: Image.asset(AppAssets().iconCrypto),
          label: 'Movimentações',
          tooltip: 'Movimentações',
        ),
      ],
      selectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.8,
      ),
      selectedItemColor: AppAssets().colorBlack,
      unselectedLabelStyle: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedItemColor: const Color.fromRGBO(149, 153, 166, 1),
      currentIndex: pageSelectedIndex.state,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const PortfolioScreen(),
                transitionDuration: const Duration(milliseconds: 0),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const TransactionsScreen(),
                transitionDuration: const Duration(milliseconds: 0),
              ),
            );
            break;
        }

        pageSelectedIndex.state = index;
      },
    );
  }
}
