import 'package:flutter/material.dart';
import 'package:pettopia/models/pet_model.dart';
import 'package:pettopia/models/post_model.dart';
import 'package:pettopia/models/product_model.dart';
import 'package:pettopia/models/shelter_model.dart';
import 'package:pettopia/models/vet_model.dart';
import 'package:pettopia/services/api_services.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ApiProvider extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<PostModel> posts = [];
  List<ProductModel> prods = [];
  List<PetModel> adops = [];
  List<PetModel> mates = [];
  List<ShelterModel> shelters = [];
  List<VetModel> vets = [];

  String message = '';

  HomeState get homeState => _homeState;

  ApiProvider(int i) {
    if (i == 0)
      _fetchPosts();
    else if (i == 1)
      _fetchAdops();
    else if (i == 2)
      _fetchMate();
    else if (i == 3)
      _fetchShelters();
    else if (i == 4)
      _fetchVets();
    else if (i == 5)
      _fetchProducts();
    else {
      _fetchPosts();
      _fetchAdops();
      _fetchMate();
      _fetchShelters();
      _fetchVets();
      _fetchProducts();
    }
  }

  Future<void> _fetchPosts() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllPosts();
      posts = apiPosts;
      print(posts);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> _fetchProducts() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllProducts();
      prods = apiPosts;
      print(prods);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> _fetchAdops() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllAdoption();
      adops = apiPosts;
      print(adops.length);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> _fetchMate() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllMate();
      mates = apiPosts;
      print(mates);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> _fetchShelters() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllShelters();
      shelters = apiPosts;
      print(shelters);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> _fetchVets() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiPosts = await Api.instance.getAllVets();
      vets = apiPosts;
      print(vets);
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }
}
