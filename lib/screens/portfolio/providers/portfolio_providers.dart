import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/portfolio_model.dart';
import '../use_case/portfolio_use_case_provider.dart';

final isVisibleProvider = StateProvider<bool>((ref) => true);

final portfolioModelProvider = StateProvider<PortfolioModel>(
  (ref) {
    return ref.read(portfolioUseCaseProvider).getPortfolioData();
  },
);
