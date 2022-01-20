class HomeGoodsModel {
  int? id;
  List<dynamic>? image;
  String? name;
  int? sold;
  String? price;
  String? integral;
  String? bcc;
  String? cv;
  String? groupCv;

  HomeGoodsModel({
    this.id,
    this.image,
    this.name,
    this.sold,
    this.price,
    this.integral,
    this.bcc,
    this.cv,
    this.groupCv,
  });

  factory HomeGoodsModel.fromJson(Map<String, dynamic> json) {
    return HomeGoodsModel(
      id: json['id'] as int?,
      image: json['image'] as List<dynamic>?,
      name: json['name'] as String?,
      sold: json['sold'] as int?,
      price: json['price'] as String?,
      integral: json['integral'] as String?,
      bcc: json['bcc'] as String?,
      cv: json['cv'] as String?,
      groupCv: json['group_cv'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'sold': sold,
        'price': price,
        'integral': integral,
        'bcc': bcc,
        'cv': cv,
        'group_cv': groupCv,
      };
}
