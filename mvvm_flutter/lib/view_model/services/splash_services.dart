import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_names.dart';
import 'package:mvvm_flutter/view_model/user_view_model.dart';
import '../../model/user_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) async{
    getUserData().then((value) async {
      if(value.token.toString() == "null" || value.token.toString() == ""){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.login);
      }else{
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.home);
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }




}