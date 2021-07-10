import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pettopia/data/constants.dart';
import 'package:pettopia/models/user_model.dart';

class Authentication {
  static Authentication _instance = Authentication._();
  Authentication._();

  static Authentication get instance {
    return _instance;
  }

  Future<UserModel> logIn(String email, String password) async {
    UserModel logInUser;
    List<UserModel> listOfUsers;
    final getUser = await http.post(
      Uri.parse(domain + 'login?e_mail=$email&password=$password'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody.length);

    if (responseBody == 0) {
      return UserModel(id: -1);
    } else {
      listOfUsers = responseBody
          .map((e) => UserModel.fromJson(e))
          .cast<UserModel>()
          .toList();
      print(listOfUsers[0].eMail);
      return listOfUsers[0];
    }
    // responseBody[0].toString()

    // return responseBody.map((e) => UserModel.fromJson(e));
  }

  Future<UserModel> registerUser(
      String name, String email, String password, String number) async {
    UserModel logInUser;
    // var responseBody;
    // final image = await rootBundle.load('assets/images/cat.png');
    // final file = File('${(await getTemporaryDirectory()).path}/path');
    // await file.writeAsBytes(
    //     image.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes));

    // List<UserModel> listOfUsers;
    final getUser = await http.post(
      Uri.parse(domain +
          'signup?name=$name&e_mail=$email&phone=$number&gender=female&password=$password&age=14&photo=cat.png'),
    );
    // getUser.files.add(await http.MultipartFile.fromPath('photo', file.path,
    //     contentType: new MediaType('image', 'png')));
    // responseBody = await getUser.send();
    // responseBody = await http.Response.fromStream(responseBody);
    final responseBody = json.decode(getUser.body);
    print(responseBody);

    if (responseBody == 0) {
      return UserModel(id: -1);
    } else {
      // logInUser = responseBody
      //     .map((e) => UserModel.fromJson(e))
      //     .cast<UserModel>()
      //     .toList();
      logInUser = UserModel.fromJson(responseBody);
      print(logInUser.eMail);
      return logInUser;
    }
  }

  Future<int> getUserId(String email) async {
    int userId;
    final getUser = await http.post(
      Uri.parse(domain + 'verify?e_mail=$email'),
    );
    int responseBody = json.decode(getUser.body);
    print('this is ' + responseBody.toString());
    // getUser.bodyBytes.first.toString()
    return responseBody;
  }

  Future<String> updateUserPw(int id, String pw) async {
    int userId;
    final getUser = await http.post(
      Uri.parse(domain + 'update/$id?new_password=$pw'),
    );
    final responseBody = getUser.body;
    print('this is ' + responseBody.toString());
    // getUser.bodyBytes.first.toString()
    return responseBody;
  }
  // mapUserFromApi(List<dynamic> responseBody) {
  //   return UserModel(
  //       id: responseBody[0]["id"],
  //       name: responseBody[0]["name"],
  //       eMail: responseBody[0]["e_mail"],
  //       phone: responseBody[0]["phone"],
  //       gender: responseBody[0]["gender"],
  //       photo: responseBody[0]["photo"],
  //       age: responseBody[0]["age"],
  //       createdAt: responseBody[0]["created_at"],
  //       updatedAt: responseBody[0]["updated_at"]);
  // }
}
