class ApiDictModel {
  String? imagePrefix;
  String? serviceWeixin;
  String? speedCardDay;
  String? speedCardPrice;
  String? appVersions;
  String? updateInfo;
  String? apkUrl;
  String? hideWithdrawCoin;
  String? hideRechargeCoin;
  String? hideWithdrawCny;
  String? hideSubscription;
  String? hideBuyback;

  ApiDictModel({
    this.imagePrefix,
    this.serviceWeixin,
    this.speedCardDay,
    this.speedCardPrice,
    this.appVersions,
    this.updateInfo,
    this.apkUrl,
    this.hideWithdrawCoin,
    this.hideRechargeCoin,
    this.hideWithdrawCny,
    this.hideSubscription,
    this.hideBuyback,
  });

  factory ApiDictModel.fromJson(Map<String, dynamic> json) => ApiDictModel(
        imagePrefix: json['image_prefix'] as String?,
        serviceWeixin: json['service_weixin'] as String?,
        speedCardDay: json['speed_card_day'] as String?,
        speedCardPrice: json['speed_card_price'] as String?,
        appVersions: json['app_versions'] as String?,
        updateInfo: json['update_info'] as String?,
        apkUrl: json['apk_url'] as String?,
        hideWithdrawCoin: json['hide_withdraw_coin'] as String?,
        hideRechargeCoin: json['hide_recharge_coin'] as String?,
        hideWithdrawCny: json['hide_withdraw_cny'] as String?,
        hideSubscription: json['hide_subscription'] as String?,
        hideBuyback: json['hide_buyback'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_prefix': imagePrefix,
        'service_weixin': serviceWeixin,
        'speed_card_day': speedCardDay,
        'speed_card_price': speedCardPrice,
        'app_versions': appVersions,
        'update_info': updateInfo,
        'apk_url': apkUrl,
        'hide_withdraw_coin': hideWithdrawCoin,
        'hide_recharge_coin': hideRechargeCoin,
        'hide_withdraw_cny': hideWithdrawCny,
        'hide_subscription': hideSubscription,
        'hide_buyback': hideBuyback,
      };
}
