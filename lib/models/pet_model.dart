class PetModel {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? color;
  String? bread;
  String? photo;
  String? diseases;
  String? vaccinations;
  String? type;
  int? section;
  int? userId;

  PetModel({
      this.id, 
      this.name, 
      this.age, 
      this.gender, 
      this.color, 
      this.bread, 
      this.photo, 
      this.diseases, 
      this.vaccinations, 
      this.type, 
      this.section, 
      this.userId});

  PetModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    age = json["age"];
    gender = json["gender"];
    color = json["color"];
    bread = json["bread"];
    photo = json["photo"];
    diseases = json["diseases"];
    vaccinations = json["vaccinations"];
    type = json["type"];
    section = json["section"];
    userId = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["age"] = age;
    map["gender"] = gender;
    map["color"] = color;
    map["bread"] = bread;
    map["photo"] = photo;
    map["diseases"] = diseases;
    map["vaccinations"] = vaccinations;
    map["type"] = type;
    map["section"] = section;
    map["user_id"] = userId;
    return map;
  }

}