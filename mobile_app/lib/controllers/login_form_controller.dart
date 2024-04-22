import 'package:flutter/material.dart';
import 'package:orderease/common/loadings.dart';
import 'package:orderease/common/snackbars.dart';
import 'package:orderease/providers/login_state_provider.dart';
import 'package:orderease/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginFormController {
  late TextEditingController _textFieldSecretCodeController;
  late LoginStateProvider loginStateProvider;

  LoginFormController() {
    _textFieldSecretCodeController = TextEditingController();
  }

  TextEditingController getFieldController() {
    return _textFieldSecretCodeController;
  }

  setValue(dynamic value) {
    if (value is Widget) {
      if (_textFieldSecretCodeController.text.isNotEmpty) {
        _textFieldSecretCodeController.text = _textFieldSecretCodeController
            .text
            .substring(0, _textFieldSecretCodeController.text.length - 1);
      }
    } else {
      if (_textFieldSecretCodeController.text.length + 1 <= 6) {
        _textFieldSecretCodeController.text =
            _textFieldSecretCodeController.text + value;
      }
    }
  }

  processLogin(BuildContext context) async{
    loginStateProvider = Provider.of<LoginStateProvider>(context, listen: false);
    loginStateProvider.setLoginInProgressValue(false);
    if (_textFieldSecretCodeController.text.isEmpty) {
      AppSnackbars.showErrorSnackbar(context, "Veuillez saisir le code");
      loginStateProvider.setLoginInProgressValue(true);
    } else if(_textFieldSecretCodeController.text.length < 6){
      AppSnackbars.showErrorSnackbar(context, "Veuillez saisir un code valide");
      loginStateProvider.setLoginInProgressValue(true);
    }
    else {
      AppLoadings.showDefaultEasyLoading(status: "");
      Future.delayed(const Duration(seconds: 5), (){
        AppLoadings.hideEasyLoading();
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => const HomeScreen()
          )
        );
        loginStateProvider.setLoginInProgressValue(true);
      });
    }
  }
}
