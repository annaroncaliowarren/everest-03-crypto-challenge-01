import 'package:flutter/material.dart';

import 'button_complete_conversion.dart';
import 'wrap_list_tile_review_screen.dart';

class BodyReviewScreen extends StatelessWidget {
  const BodyReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Text(
              'Revise os dados da sua conversão',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          WrapListTileReviewScreen(),
          ButtonCompleteConversion(),
        ],
      ),
    );
  }
}
