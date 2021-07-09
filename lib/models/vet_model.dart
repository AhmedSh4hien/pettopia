class VetModel {
  int? id;
  String? name;
  int? age;
  String? location;
  String? description;

  VetModel({this.id, this.name, this.age, this.location, this.description});

  VetModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    age = json["age"];
    location = json["location"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["age"] = age;
    map["location"] = location;
    map["description"] = description;
    return map;
  }
}
