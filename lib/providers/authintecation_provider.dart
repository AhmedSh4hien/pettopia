import 'package:flutter/material.dart';
import 'package:pettopia/models/user_model.dart';
import 'package:pettopia/services/authintecation.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  NoAcc,
  Error,
}

class UserProvider extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  HomeState _registerState = HomeState.Initial;

  UserModel currentUser = UserModel();
  String message = '';

  String loginMessage = '';
  String loginEmail = '';
  String loginPassword = '';

  String registerMessage = '';
  String registerEmail = '';
  String registerPassword = '';
  String registerName = '';
  String registerNumber = '';

  int retrieveID = 0;
  String pwForgotEmail = '';
  String changedPW = '';
  String confirmPW = '';
  String changePwMessage = '';

  // UserProvider() {
  //   UserProvider();
  // }

  HomeState get homeState => _homeState;
  HomeState get registerState => _registerState;

  Future<void> loginUser() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiUser =
          await Authentication.instance.logIn(loginEmail, loginPassword);
      print('this is api user' + apiUser.toString());
      if (apiUser.id == -1) {
        loginMessage = 'This user doesn\'t exist';

        _homeState = HomeState.NoAcc;
      } else {
        currentUser = apiUser;
        // print(user);
        // loginMessage = apiUser;
        _homeState = HomeState.Loaded;
      }
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> registerUser() async {
    _registerState = HomeState.Loading;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 1));
      final apiUser = await Authentication.instance.registerUser(
          registerName, registerEmail, registerPassword, registerNumber);
      print('this is api user' + apiUser.toString());
      if (apiUser.id == -1) {
        loginMessage = 'This user doesn\'t exist';

        _registerState = HomeState.NoAcc;
      } else {
        currentUser = apiUser;
        // print(user);
        // loginMessage = apiUser;
        _registerState = HomeState.Loaded;
      }
    } catch (e) {
      message = '$e';
      _registerState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> getUserID() async {
    final apiUser = await Authentication.instance.getUserId(pwForgotEmail);
    retrieveID = apiUser;
    print(retrieveID);
    notifyListeners();
  }

  Future<void> updateUserPw() async {
    print(retrieveID);
    final apiUser =
        await Authentication.instance.updateUserPw(retrieveID, changedPW);
    changePwMessage = apiUser;
    print(changePwMessage);
    notifyListeners();
  }
}
