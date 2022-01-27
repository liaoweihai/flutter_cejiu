class ShopingDetailModel {
  int? id;
  List<String>? image;
  String? name;
  int? sold;
  String? price;
  String? integral;
  String? bcc;
  String? cv;
  String? groupCv;
  int? sort;
  List<ShopingDetailOption>? option;
  String? content;

  ShopingDetailModel(
      {this.id,
      this.image,
      this.name,
      this.sold,
      this.price,
      this.integral,
      this.bcc,
      this.cv,
      this.groupCv,
      this.sort,
      this.option,
      this.content});

  ShopingDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'].cast<String>();
    name = json['name'];
    sold = json['sold'];
    price = json['price'];
    integral = json['integral'];
    bcc = json['bcc'];
    cv = json['cv'];
    groupCv = json['group_cv'];
    sort = json['sort'];
    if (json['option'] != null) {
      option = <ShopingDetailOption>[];
      json['option'].forEach((v) {
        option!.add(ShopingDetailOption.fromJson(v));
      });
    }
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['sold'] = sold;
    data['price'] = price;
    data['integral'] = integral;
    data['bcc'] = bcc;
    data['cv'] = cv;
    data['group_cv'] = groupCv;
    data['sort'] = sort;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    data['content'] = content;
    return data;
  }
}

class ShopingDetailOption {
  int? id;
  String? name;
  List<String>? item;

  ShopingDetailOption({this.id, this.name, this.item});

  ShopingDetailOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    item = json['item'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['item'] = item;
    return data;
  }
}
