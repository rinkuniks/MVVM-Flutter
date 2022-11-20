import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void flushBarErrorMessage(String messages, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: messages,
          backgroundColor: Colors.redAccent,
          messageColor: Colors.white,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.TOP,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 2),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
