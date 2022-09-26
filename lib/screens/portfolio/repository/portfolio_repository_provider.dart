import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data_source/get_portfolio_database_provider.dart';
import 'portfolio_repository.dart';

final portfolioRepositoryProvider = Provider<PortfolioRepository>(
  (ref) => PortfolioRepository(
    database: ref.read(getPortfolioDatabaseProvider),
  ),
);
