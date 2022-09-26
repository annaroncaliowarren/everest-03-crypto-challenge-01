import '../models/portfolio_model.dart';
import '../repository/portfolio_repository.dart';

class PortfolioUseCase {
  final PortfolioRepository repository;

  PortfolioUseCase({
    required this.repository,
  });

  PortfolioModel getPortfolioData() {
    return repository.getPortfolioData();
  }
}

