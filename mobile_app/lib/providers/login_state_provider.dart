import 'package:flutter/material.dart';

class LoginStateProvider extends ChangeNotifier{

  bool __isLoginInProgress = true;

  LoginStateProvider(){

  }

  bool get isLoginProgress => __isLoginInProgress;

  void setLoginInProgressValue(bool value){
    __isLoginInProgress = value;
    notifyListeners();
  }

}