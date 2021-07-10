class ShelterModel {
  int? id;
  String? name;
  String? details;
  String? location;
  dynamic? phone;
  dynamic? photo;

  ShelterModel({
      this.id, 
      this.name, 
      this.details, 
      this.location, 
      this.phone, 
      this.photo});

  ShelterModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    details = json["details"];
    location = json["location"];
    phone = json["phone"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["details"] = details;
    map["location"] = location;
    map["phone"] = phone;
    map["photo"] = photo;
    return map;
  }

}