import 'package:crypto_list/shared/widgets/app_bar_default_app.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  static const reviewRoute = '/portfolio/details/conversion/review';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDefaultApp(
        title: 'Revisar',
      ),
      //body: BodyReviewScreen(),
    );
  }
}
