class UserModel {
  String? name;
  String? eMail;
  String? phone;
  String? gender;
  String? photo;
  String? age;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserModel(
      {this.name,
      this.eMail,
      this.phone,
      this.gender,
      this.photo,
      this.age,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserModel.fromJson(dynamic json) {
    name = json["name"];
    eMail = json["e_mail"];
    phone = json["phone"];
    gender = json["gender"];
    photo = json["photo"];
    age = json["age"].toString();
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["e_mail"] = eMail;
    map["phone"] = phone;
    map["gender"] = gender;
    map["photo"] = photo;
    map["age"] = age;
    map["updated_at"] = updatedAt;
    map["created_at"] = createdAt;
    map["id"] = id;
    return map;
  }
}
