import 'package:flutter/material.dart';
import 'package:orderease/constants/colors.dart';

class AppSnackbars{
  static void showErrorSnackbar(BuildContext context, String msg){
    final snackBar = SnackBar(
        backgroundColor: AppColors.color6,
        content: Text(
          msg,
          style: TextStyle(color: AppColors.color5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}