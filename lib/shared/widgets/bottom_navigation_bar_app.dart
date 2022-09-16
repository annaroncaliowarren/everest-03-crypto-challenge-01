import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/transactions/widgets/body_transactions_screen.dart';
import '../../screens/portfolio/widgets/body_portfolio_screen.dart';
import '../utils/app_assets.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  static const route = '/initial-screen';

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const BodyPortfolioScreen(),
    const BodyTransactionsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
