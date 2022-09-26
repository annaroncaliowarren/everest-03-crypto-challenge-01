import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final priceProvider = StateProvider<Decimal>((ref) => Decimal.parse('0'));
