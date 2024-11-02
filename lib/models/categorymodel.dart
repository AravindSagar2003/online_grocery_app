class Category {
  List<Data>? data;
  String? message;
  bool? success;

  Category({this.data, this.message, this.success});

  Category.fromJson(Map<String, dynamic> json) {
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
  String? categoryname;
  String? categoryimage;

  Data({this.id, this.categoryname, this.categoryimage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryname = json['categoryname'];
    categoryimage = json['categoryimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryname'] = this.categoryname;
    data['categoryimage'] = this.categoryimage;
    return data;
  }
}
