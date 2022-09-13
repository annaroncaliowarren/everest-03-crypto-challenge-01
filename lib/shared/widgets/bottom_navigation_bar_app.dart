import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_assets.dart';
import '../../presenter/movements/movements_screen.dart';
import '../../presenter/wallet/wallet_screen.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const BodyWalletScreen(),
    const BodyMovementsScreen(),
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
        selectedItemColor: const Color.fromRGBO(47, 47, 51, 1),
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
