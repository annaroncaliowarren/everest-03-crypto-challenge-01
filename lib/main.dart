import 'package:crypto_list/presenter/movements/movements_screen.dart';
import 'package:crypto_list/presenter/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_assets.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Wallet - Crypto List',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            icon: Image.asset(iconWarrenOutlined),
            activeIcon: Image.asset(iconWarren),
            label: 'Portfólio',
            tooltip: 'Portfólio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(iconCryptoOutlined),
            activeIcon: Image.asset(iconCrypto),
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
