import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppLoadings{
  static void showDefaultEasyLoading({String status = "Loading..."}) async{
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.show(status: status, dismissOnTap: false);
  }


  static void showSuccessEasyLoading({String msg = ""}) async{
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.showSuccess(msg);
  }

  static void showInfoEasyLoading({String msg = ""}) async{
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.showInfo(msg);
  }


  static void showErrorEasyLoading({String msg = ""}) async{
    await Future.delayed(const Duration(milliseconds: 1));
    EasyLoading.showError(msg);
  }

  static void hideEasyLoading(){
    EasyLoading.dismiss();
  }
}