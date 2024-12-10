// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:dialogs/app_dialog_utils.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../assets/animation_assets.dart';

class AppDialogs {
  static void showFailDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.errorAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showInfoDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.infoAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showLoading(
      {required String message, required BuildContext context}) {
    AppDialogUtils.showLoadingDialog(context: context, message: message);
  }

  static void showSuccessDialog(
      {required String message,
      required BuildContext context,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    AppDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationsAssets.checkAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showInfoToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.pink,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
