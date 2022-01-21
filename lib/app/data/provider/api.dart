import 'package:flutter_soon/app/data/provider/http_request.dart';

class AppApiClient {
  /// static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final AppApiClient _instance = AppApiClient._internal();

  ///提供了一个工厂方法来获取该类的实例
  factory AppApiClient() {
    return _instance;
  }

  /// 通过私有方法_internal()隐藏了构造方法，防止被误创建
  AppApiClient._internal() {
    /// 初始化
    init();
  }

  /// Singleton._internal(); /// 不需要初始化
  void init() {
    /// print("这里初始化");
  }

  /// 登录
  Future login({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/login', params: paramas);

  /// 初始化配置
  Future apiDict({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/dict', params: paramas);

  /// 首页 (轮播图 )
  Future index({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/index', params: paramas);

  /// 商品列表
  Future goods({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/goods', params: paramas);

  ///公共分类
  Future getOss({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/oss/sts/uni', params: paramas);

  /// 注册
  Future register({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('register', params: paramas);

  /// 验证码
  Future getCode({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('sms/send', params: paramas);

  /// 修改密码
  Future passwordChange({Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('user/password/code', params: paramas);

  /// 区域
  Future region({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('region', params: paramas);

  ///个人资产
  Future marketAssets({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/assets', params: paramas);

  ///均价走势
  Future marketDailyPrice({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/dailyPrice', params: paramas);

  ///交易市场列表
  Future marketBuyOrderList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/buyOrderList', params: paramas);

  ///获取充币地址
  Future marketAddress({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/address', params: paramas);

  ///充币记录列表
  Future marketRechargeList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/rechargeList', params: paramas);

  ///提币记录列表
  Future marketWithdrawList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/withdrawList', params: paramas);

  ///提币
  Future marketwithdraw({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('market/withdraw', params: paramas);

  ///提币获取配置
  Future marketConfig({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/config', params: paramas);

  ///委托列表
  Future marketSaleOrderList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/saleOrderList', params: paramas);

  ///撤销委托
  Future marketCancel(String id) => ApiRequest().putRequest(
        'market/cancel/' + id,
      );

  ///个人订单列表
  Future marketMyOrder({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/myOrder', params: paramas);

  ///发布委托
  Future marketOrder({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('market/order', params: paramas);

  ///订单详情
  Future marketOrderInfo(String id) => ApiRequest().getRequest(
        'market/orderInfo/' + id,
      );

  /// 买入
  Future marketbuy({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('market/buy', params: paramas);

  ///人民币提现
  Future marketCnyWithdraw({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('market/cnyWithdraw', params: paramas);

  ///人民币提现记录
  Future marketCnyWithdrawList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('market/cnyWithdrawList', params: paramas);

  ///认购信息
  Future getTokenSubscription({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('token/subscription', params: paramas);

  ///新增认购
  Future postTokenSubscription({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('token/subscription', params: paramas);

  ///认购记录
  Future tokenSubscriptionList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('token/subscriptionList', params: paramas);

  ///回购信息
  Future getTokenBuyback({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('token/buyback', params: paramas);

  ///新增回购
  Future putTokenBuyback(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('token/buyback/' + id, params: paramas);

  ///回购记录
  Future tokenBuybackList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('token/buybackList', params: paramas);

  ///贡献值明细
  Future detailCV({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('detail/cv', params: paramas);

  ///积分明细
  Future detailIntegral({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('detail/integral', params: paramas);

  ///BCC值明细
  Future detailBCC({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('detail/bcc', params: paramas);

  ///ACC明细
  Future detailACC({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('detail/acc', params: paramas);

  ///CNY明细
  Future detailCNY({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('detail/cny', params: paramas);

  ///团购
  Future shareGroupPoster(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/groupon/$id/share', params: paramas);

  ///分享详情
  Future groupBuying({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('groupon', params: paramas);

  ///团购列表
  Future myGroupBuying({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('groupon/my', params: paramas);

  ///我的团购列表
  Future receiveGroupon(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/groupon/my/$id/receive');
  Future groupDetail(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('groupon/' + id);

  ///团购详情（含分享详情）
  Future groupGoodsDetail(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/groupon/$id/goods', params: paramas);

  ///团购商品详情
  Future joinGroup(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('groupon/' + id, params: paramas);

  ///参与团购
  Future openGroup({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('groupon', params: paramas);

  ///开团
  Future grouponById({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('groupon/order', params: paramas);

  ///团购详情（含分享详情）
  ///现金商城
  Future getGoodsList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('goods', params: paramas);

  ///商品列表
  Future getIndex({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('index', params: paramas);

  ///首页 (轮播图 )
  Future getDict({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('dict', params: paramas);

  ///获取通用字典
  Future getGoodsDetail(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('goods/' + id, params: paramas);

  ///商品详情
  Future getUserAddress({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('user/address', params: paramas);

  ///获取地址列表
  Future curOrder({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('order', params: paramas);

  ///直接购买
  Future getOrderDetail(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('order/' + id, params: paramas);

  ///购物车列表
  Future shoppingCartList({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/cart', params: paramas);

  ///添加购物车
  Future addCart({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/cart', params: paramas);

  ///编辑购物车
  Future editCart(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('/cart/' + id, params: paramas);

  //////删除购物车
  Future delCart(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().deleteRequest('cart/' + id, params: paramas);

  ///
  ///批量删除购物车
  Future delBatchCart(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().deleteRequest('cart/' + id);

  ///购物车结算
  Future cartConfirm({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('cart/confirm', params: paramas);

  //////购物车购买
  Future buyCart({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/order/cart', params: paramas);

  ///用户地址管理
  ///新增地址
  Future addAddress({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('user/address', params: paramas);

  ///获取详情
  Future getAddressDetail(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('user/address/' + id);

  ///
  ///修改地址
  Future changeAddress(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('user/address/' + id, params: paramas);

  ///删除地址
  Future deleteAddress(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().deleteRequest('user/address/' + id, params: paramas);

  ///尊享卡
  ///尊享卡购买
  Future buySpeedCard({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/speedCard', params: paramas);

  ///尊享卡购买记录
  Future getSpeedCard({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/speedCard', params: paramas);

  ///获取我的尊享卡详情
  Future getMySpeedCard({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/my/speedCard');

  ///帮助中心
  Future helper({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/helper');

  ///帮助中心详情
  Future helperDetails(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/helper/' + id, params: paramas);

  ///用户中心
  ///校验身份证
  Future checkedIdNumber({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/user/idNumber/check', params: paramas);

  ///获取用户详情
  Future myUserInfo({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/userInfo', params: paramas);

  ///签到
  Future mySign({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/sign', params: paramas);

  ///我的好友
  Future myFriend({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/user/friend', params: paramas);

  ///获取会员等级信息
  Future userLevel({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/user/level', params: paramas);

  /// ///Bcc转增
  Future bccGive({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/market/give', params: paramas);

  ///Bcc转增记录
  Future bccgiveRecord({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/market/give', params: paramas);

  ///绑定银行卡
  Future bindUserBank({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('user/bank', params: paramas);

  ///提交实名认证
  Future realAuth({Map<String, dynamic>? paramas}) =>
      ApiRequest().postRequest('/user/auth', params: paramas);

  ///获取实名认证信息
  Future getRealAuth({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('/user/auth', params: paramas);

  ///我的 -- 订单列表
  Future getOrder({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('order', params: paramas);

  ///删除订单
  Future deleteOrder(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().deleteRequest('order/' + id);

  ///订单退款
  Future refundOrder(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('order/' + id + '/refund', params: paramas);

  /// ///订单退款
  Future buyOrder(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('order/' + id + '/pay', params: paramas);

  //////分享海报
  Future userShare({Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('user/poster', params: paramas);

  ///确认收货
  Future orderConfirm(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('order/' + id + '/confirm');

  ///退款订单详情
  Future orderDetailByRefund(String id, {Map<String, dynamic>? paramas}) =>
      ApiRequest().getRequest('order/' + id, params: paramas);

  ///修改用户信息
  Future changeUserInfo({Map<String, dynamic>? paramas}) =>
      ApiRequest().putRequest('user', params: paramas);
}
