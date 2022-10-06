import 'package:flutter/material.dart';

import '../widgets/app_bar_confirmed_conversion_screen.dart';
import '../widgets/body_confirmed_conversion_screen.dart';

class ConfirmedConversionScreen extends StatelessWidget {
  const ConfirmedConversionScreen({Key? key}) : super(key: key);

  static const confirmedConversionRoute = '/portfolio/details/conversion/review/confirmed-conversion';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarConfirmedConversionScreen(),
      body: BodyConfirmedConversionScreen(),
    );
  }
}
