class MarketDailyPriceModel {
  List<dynamic>? list;
  String? price;
  String? change;

  MarketDailyPriceModel({this.list, this.price, this.change});

  factory MarketDailyPriceModel.fromJson(Map<String, dynamic> json) {
    return MarketDailyPriceModel(
      list: json['list'] as List<dynamic>?,
      price: json['price'] as String?,
      change: json['change'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'list': list,
        'price': price,
        'change': change,
      };
}
