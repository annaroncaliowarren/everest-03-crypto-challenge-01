import '../data_source/get_portfolio_database.dart';
import '../models/portfolio_model.dart';

class PortfolioRepository {
  final GetPortfolioDatabase database;

  PortfolioRepository({
    required this.database,
  });

  PortfolioModel getPortfolioData() {
    return database.getPortfolioData();
  }
}
