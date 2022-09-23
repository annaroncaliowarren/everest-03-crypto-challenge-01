import 'dart:convert';

class CoinModel {
  final String base;
  final String baseId;
  final int unitPriceScale;
  final String currency;
  final Prices prices;

  CoinModel({
    required this.base,
    required this.baseId,
    required this.unitPriceScale,
    required this.currency,
    required this.prices,
  });

  CoinModel copyWith({
    String? base,
    String? baseId,
    int? unitPriceScale,
    String? currency,
    Prices? prices,
  }) {
    return CoinModel(
      base: base ?? this.base,
      baseId: baseId ?? this.baseId,
      unitPriceScale: unitPriceScale ?? this.unitPriceScale,
      currency: currency ?? this.currency,
      prices: prices ?? this.prices,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'base': base,
      'base_id': baseId,
      'unit_price_scale': unitPriceScale,
      'currency': currency,
      'prices': prices.toMap(),
    };

    return result;
  }

  factory CoinModel.fromMap(Map<String, dynamic> coin) {
    return CoinModel(
      base: coin['base'] ?? '',
      baseId: coin['base_id'] ?? '',
      unitPriceScale: coin['unit_price_scale']?.toInt() ?? 0,
      currency: coin['currency'] ?? '',
      prices: Prices.fromMap(coin['prices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinModel(base: $base, base_id: $baseId, unit_price_scale: $unitPriceScale, currency: $currency, prices: $prices)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinModel &&
        other.base == base &&
        other.baseId == baseId &&
        other.unitPriceScale == unitPriceScale &&
        other.currency == currency &&
        other.prices == prices;
  }

  @override
  int get hashCode {
    return base.hashCode ^
        baseId.hashCode ^
        unitPriceScale.hashCode ^
        currency.hashCode ^
        prices.hashCode;
  }
}

class Prices {
  final String latest;
  final LatestPrice latestPrice;

  Prices({
    required this.latest,
    required this.latestPrice,
  });

  Prices copyWith({
    String? latest,
    LatestPrice? latestPrice,
  }) {
    return Prices(
      latest: latest ?? this.latest,
      latestPrice: latestPrice ?? this.latestPrice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'latest': latest});
    result.addAll({'latest_price': latestPrice.toMap()});

    return result;
  }

  factory Prices.fromMap(Map<String, dynamic> map) {
    return Prices(
      latest: map['latest'] ?? '',
      latestPrice: LatestPrice.fromMap(map['latest_price']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prices.fromJson(String source) => Prices.fromMap(json.decode(source));

  @override
  String toString() => 'Prices(latest: $latest, latest_price: $latestPrice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prices &&
        other.latest == latest &&
        other.latestPrice == latestPrice;
  }

  @override
  int get hashCode => latest.hashCode ^ latestPrice.hashCode;
}

class LatestPrice {
  final Amount amount;
  final String timestamp;
  final PercentChange percentChange;

  LatestPrice({
    required this.amount,
    required this.timestamp,
    required this.percentChange,
  });

  LatestPrice copyWith({
    Amount? amount,
    String? timestamp,
    PercentChange? percentChange,

  }) {
    return LatestPrice(
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      percentChange: percentChange ?? this.percentChange,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'amount': amount.toMap()});
    result.addAll({'timestamp': timestamp});
    result.addAll({'percent_change': percentChange.toMap()});

    return result;
  }

  factory LatestPrice.fromMap(Map<String, dynamic> map) {
    return LatestPrice(
      amount: Amount.fromMap(map['amount']),
      timestamp: map['timestamp'] ?? '',
      percentChange: PercentChange.fromMap(map['percent_change']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LatestPrice.fromJson(String source) =>
      LatestPrice.fromMap(json.decode(source));

  @override
  String toString() =>
      'Latest_price(amount: $amount, timestamp: $timestamp, percent_change: $percentChange)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatestPrice &&
        other.amount == amount &&
        other.timestamp == timestamp &&
        other.percentChange == percentChange;
  }

  @override
  int get hashCode =>
      amount.hashCode ^ timestamp.hashCode ^ percentChange.hashCode;
}

class Amount {
  final String amount;
  final String currency;
  final String scale;
  Amount({
    required this.amount,
    required this.currency,
    required this.scale,
  });

  Amount copyWith({
    String? amount,
    String? currency,
    String? scale,
  }) {
    return Amount(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      scale: scale ?? this.scale,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'amount': amount});
    result.addAll({'currency': currency});
    result.addAll({'scale': scale});

    return result;
  }

  factory Amount.fromMap(Map<String, dynamic> map) {
    return Amount(
      amount: map['amount'] ?? '',
      currency: map['currency'] ?? '',
      scale: map['scale'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Amount.fromJson(String source) => Amount.fromMap(json.decode(source));

  @override
  String toString() =>
      'Amount(amount: $amount, currency: $currency, scale: $scale)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Amount &&
        other.amount == amount &&
        other.currency == currency &&
        other.scale == scale;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode ^ scale.hashCode;
}

class PercentChange {
  final double hour;
  final double day;
  final double week;
  final double month;
  final double year;
  final double all;

  PercentChange({
    required this.hour,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
    required this.all,
  });

  PercentChange copyWith({
    double? hour,
    double? day,
    double? week,
    double? month,
    double? year,
    double? all,
  }) {
    return PercentChange(
      hour: hour ?? this.hour,
      day: day ?? this.day,
      week: week ?? this.week,
      month: month ?? this.month,
      year: year ?? this.year,
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'hour': hour});
    result.addAll({'day': day});
    result.addAll({'week': week});
    result.addAll({'month': month});
    result.addAll({'year': year});
    result.addAll({'all': all});

    return result;
  }

  factory PercentChange.fromMap(Map<String, dynamic> map) {
    return PercentChange(
      hour: map['hour']?.toDouble() ?? 0.0,
      day: map['day']?.toDouble() ?? 0.0,
      week: map['week']?.toDouble() ?? 0.0,
      month: map['month']?.toDouble() ?? 0.0,
      year: map['year']?.toDouble() ?? 0.0,
      all: map['all']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PercentChange.fromJson(String source) =>
      PercentChange.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Percent_change(hour: $hour, day: $day, week: $week, month: $month, year: $year, all: $all)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PercentChange &&
        other.hour == hour &&
        other.day == day &&
        other.week == week &&
        other.month == month &&
        other.year == year &&
        other.all == all;
  }

  @override
  int get hashCode {
    return hour.hashCode ^
        day.hashCode ^
        week.hashCode ^
        month.hashCode ^
        year.hashCode ^
        all.hashCode;
  }
}
