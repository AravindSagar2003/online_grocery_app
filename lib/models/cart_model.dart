class Cart {
  int? id;
  String? userid;
  String? quantity;
  String? productname;
  String? cartstatus;
  String? price;
  String? productid;
  String? image;

  Cart(
      {this.id,
      this.userid,
      this.quantity,
      this.productname,
      this.cartstatus,
      this.price,
      this.productid,
      this.image});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    quantity = json['quantity'];
    productname = json['productname'];
    cartstatus = json['cartstatus'];
    price = json['price'];
    productid = json['productid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['quantity'] = this.quantity;
    data['productname'] = this.productname;
    data['cartstatus'] = this.cartstatus;
    data['price'] = this.price;
    data['productid'] = this.productid;
    data['image'] = this.image;
    return data;
  }
}
