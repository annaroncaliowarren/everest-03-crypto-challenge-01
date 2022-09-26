import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'get_portfolio_database.dart';

final getPortfolioDatabaseProvider = Provider<GetPortfolioDatabase>(
  (ref) => GetPortfolioDatabase(),
);
