class MarketBuyOrderListModel {
  int? id;
  String? avatar;
  String? nickname;
  String? price;
  String? totalNum;
  String? num;
  String? freezeNum;
  String? surplusNum;

  MarketBuyOrderListModel({
    this.id,
    this.avatar,
    this.nickname,
    this.price,
    this.totalNum,
    this.num,
    this.freezeNum,
    this.surplusNum,
  });

  factory MarketBuyOrderListModel.fromJson(Map<String, dynamic> json) {
    return MarketBuyOrderListModel(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      nickname: json['nickname'] as String?,
      price: json['price'] as String?,
      totalNum: json['total_num'] as String?,
      num: json['num'] as String?,
      freezeNum: json['freeze_num'] as String?,
      surplusNum: json['surplus_num'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'avatar': avatar,
        'nickname': nickname,
        'price': price,
        'total_num': totalNum,
        'num': num,
        'freeze_num': freezeNum,
        'surplus_num': surplusNum,
      };
}
