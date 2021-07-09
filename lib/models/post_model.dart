class PostModel {
  int? id;
  String? post;
  dynamic? userId;

  PostModel({this.id, this.post, this.userId});

  PostModel.fromJson(dynamic json) {
    id = json["id"];
    post = json["post"];
    userId = json["user_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["post"] = post;
    map["user_id"] = userId;
    return map;
  }
}
