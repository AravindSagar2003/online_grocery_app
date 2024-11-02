class FetchProduct {
  List<Data>? data;
  String? message;
  bool? success;

  FetchProduct({this.data, this.message, this.success});

  FetchProduct.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? productname;
  String? price;
  String? image;
  int? category;

  Data({this.id, this.productname, this.price, this.image, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productname = json['productname'];
    price = json['price'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}
