import 'package:decimal/decimal.dart';

class UserInfoModel {
  String? id;
  String? inviterId;
  String? avatar;
  String? inviterCode;
  String? nickname;
  String? jiu;
  String? bcc;
  String? auth;
  String? signBcc;

  UserInfoModel({
    this.id,
    this.inviterId,
    this.avatar,
    this.inviterCode,
    this.nickname,
    this.jiu,
    this.bcc,
    this.auth,
    this.signBcc,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json['id'] as String?,
        inviterId: json['inviter_id'] as String?,
        avatar: json['avatar'] as String?,
        inviterCode: json['inviter_code'] as String?,
        nickname: json['nickname'] as String?,
        jiu: json['jiu'] as String?,
        bcc: json['bcc'] as String?,
        auth: json['auth'] as String?,
        signBcc: json['sign_bcc'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'inviter_id': inviterId,
        'avatar': avatar,
        'inviter_code': inviterCode,
        'nickname': nickname,
        'jiu': jiu,
        'bcc': bcc,
        'auth': auth,
        'sign_bcc': signBcc,
      };

  String? bccValue() {
    return Decimal.parse(bcc ?? '').floor(scale: 2).toString();
  }

  String? jiuValue() {
    return Decimal.parse(jiu ?? '').floor().toString();
  }
}
