class ShopingCartModel {
  int? id;
  int? goodsId;
  String? itemName;
  int? number;
  String? name;
  String? image;
  String? price;
  bool? ifSele;

  ShopingCartModel({
    this.id,
    this.goodsId,
    this.itemName,
    this.number,
    this.name,
    this.image,
    this.price,
    this.ifSele = false,
  });

  factory ShopingCartModel.fromJson(Map<String, dynamic> json) {
    return ShopingCartModel(
      id: json['id'] as int?,
      goodsId: json['goods_id'] as int?,
      itemName: json['item_name'] as String?,
      number: json['number'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'goods_id': goodsId,
        'item_name': itemName,
        'number': number,
        'name': name,
        'image': image,
        'price': price,
      };
}
