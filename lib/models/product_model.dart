class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? userId;
  String? location;
  dynamic? photo;

  ProductModel({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.userId, 
      this.location, 
      this.photo});

  ProductModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    userId = json["user_id"];
    location = json["location"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["price"] = price;
    map["user_id"] = userId;
    map["location"] = location;
    map["photo"] = photo;
    return map;
  }

}