import 'dart:convert';

import 'package:pettopia/models/user_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Api _instance = Api();

  static Api get instance => _instance;

  Api();

  Future<List<UserModel>> getAllUser() async {
    final getUser =
        await http.post(Uri.parse('https://10.0.2.2/api/'), headers: {
      'Accept': '*/*',
    });
    final List responseBody = jsonDecode(getUser.body);
    return responseBody.map((e) => UserModel.fromJson(e)).toList();
  }
}
