import 'package:flutter/material.dart';

import '../widgets/body_movements_screen.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  static const route = '/movements';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyMovementsScreen(),
    );
  }
}

