class UserAssetsModel {
  int? userId;
  String? acc;
  String? bcc;
  String? integral;
  String? cv;
  String? jiu;
  String? cny;
  String? hideWithdrawCoin;
  String? hideRechargeCoin;
  String? hideWithdrawCny;
  String? hideSubscription;
  String? hideBuyback;

  UserAssetsModel({
    this.userId,
    this.acc,
    this.bcc,
    this.integral,
    this.cv,
    this.jiu,
    this.cny,
    this.hideWithdrawCoin,
    this.hideRechargeCoin,
    this.hideWithdrawCny,
    this.hideSubscription,
    this.hideBuyback,
  });

  factory UserAssetsModel.fromJson(Map<String, dynamic> json) {
    return UserAssetsModel(
      userId: json['user_id'] as int?,
      acc: json['acc'] as String?,
      bcc: json['bcc'] as String?,
      integral: json['integral'] as String?,
      cv: json['cv'] as String?,
      jiu: json['jiu'] as String?,
      cny: json['cny'] as String?,
      hideWithdrawCoin: json['hide_withdraw_coin'] as String?,
      hideRechargeCoin: json['hide_recharge_coin'] as String?,
      hideWithdrawCny: json['hide_withdraw_cny'] as String?,
      hideSubscription: json['hide_subscription'] as String?,
      hideBuyback: json['hide_buyback'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'acc': acc,
        'bcc': bcc,
        'integral': integral,
        'cv': cv,
        'jiu': jiu,
        'cny': cny,
        'hide_withdraw_coin': hideWithdrawCoin,
        'hide_recharge_coin': hideRechargeCoin,
        'hide_withdraw_cny': hideWithdrawCny,
        'hide_subscription': hideSubscription,
        'hide_buyback': hideBuyback,
      };
}
