import 'package:flutter/material.dart';

import '../../portfolio/model/crypto_model.dart';
import '../widgets/app_bar_details_screen.dart';
import '../widgets/body_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  final CryptoModel cryptoModel;

  const DetailsScreen({
    Key? key,
    required this.cryptoModel,
  }) : super(key: key);

  static const detailsRoute = '/portfolio/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDetailsScreen(),
      body: SingleChildScrollView(
        child: BodyDetailsScreen(
          cryptoModel: cryptoModel,
        ),
      ),
    );
  }
}
