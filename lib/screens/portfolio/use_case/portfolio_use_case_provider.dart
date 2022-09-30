import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/portfolio_repository_provider.dart';
import 'portfolio_use_case.dart';

final portfolioUseCaseProvider = Provider<PortfolioUseCase>(
  (ref) => PortfolioUseCase(
    repository: ref.read(portfolioRepositoryProvider),
  ),
);