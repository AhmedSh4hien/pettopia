import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pettopia/data/constants.dart';
import 'package:pettopia/models/pet_model.dart';
import 'package:pettopia/models/post_model.dart';
import 'package:pettopia/models/product_model.dart';
import 'package:pettopia/models/shelter_model.dart';
import 'package:pettopia/models/vet_model.dart';

class Api {
  static Api _instance = Api();

  static Api get instance => _instance;

  Api();

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> listPosts;
    final getUser = await http.post(
      Uri.parse(domain + 'allposts'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString());
    listPosts = responseBody['results']
        .map((e) => PostModel.fromJson(e))
        .cast<PostModel>()
        .toList();
    return listPosts;
  }

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> listProds;
    final getUser = await http.post(
      Uri.parse(domain + 'alladopt'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString());
    listProds = responseBody['results']
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
    return listProds;
  }

  Future<List<PetModel>> getAllAdoption() async {
    List<PetModel> listAdops;
    final getUser = await http.post(
      Uri.parse(domain + 'alladopt'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString());
    listAdops = responseBody['results']
        .map((e) => PetModel.fromJson(e))
        .cast<PetModel>()
        .toList();
    return listAdops;
  }

  Future<List<PetModel>> getAllMate() async {
    List<PetModel> listMate;
    final getUser = await http.post(
      Uri.parse(domain + 'allmate'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString());
    listMate = responseBody['results']
        .map((e) => PetModel.fromJson(e))
        .cast<PetModel>()
        .toList();
    return listMate;
  }

  Future<List<ShelterModel>> getAllShelters() async {
    List<ShelterModel> listShelters;
    final getUser = await http.post(
      Uri.parse(domain + 'allshelters'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString());
    listShelters = responseBody['results']
        .map((e) => ShelterModel.fromJson(e))
        .cast<ShelterModel>()
        .toList();
    return listShelters;
  }

  Future<List<VetModel>> getAllVets() async {
    List<VetModel> listVets;
    final getUser = await http.post(
      Uri.parse(domain + 'allvet'),
    );
    final responseBody = json.decode(getUser.body);
    print(responseBody['results'].length.toString() + 'THIS IS VETS');
    listVets = responseBody['results']
        .map((e) => VetModel.fromJson(e))
        .cast<VetModel>()
        .toList();
    return listVets;
  }

  Future<PetModel> addPet(String name, String age, String gender, String type,
      String userId) async {
    PetModel addedPet;
    // var responseBody;
    // final image = await rootBundle.load('assets/images/cat.png');
    // final file = File('${(await getTemporaryDirectory()).path}/path');
    // await file.writeAsBytes(
    //     image.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes));

    // List<UserModel> listOfUsers;
    final getUser = await http.post(
      Uri.parse(domain +
          'addpet?name=$name&age=$age&gender=$gender&type=$type&id=$userId&photo=cat.png'),
    );

    final responseBody = json.decode(getUser.body);
    print(responseBody);

    return PetModel();
  }

  Future<PetModel> sellPet(String name, String age, String gender, String type,
      String location, String price, String userId) async {
    PetModel addedPet;

    // List<UserModel> listOfUsers;
    final getUser = await http.post(
      Uri.parse(domain +
          'addproduct?name=$name&age=$age&gender=$gender&type=$type&user_id=$userId&photo=cat.png&price=$price&location=$location'),
    );

    final responseBody = json.decode(getUser.body);
    print(responseBody);

    return PetModel();
  }
}
