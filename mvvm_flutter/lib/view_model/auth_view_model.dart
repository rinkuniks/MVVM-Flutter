import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/model/user_model.dart';
import 'package:mvvm_flutter/repository/auth_repository.dart';
import 'package:mvvm_flutter/utils/routes/routes_names.dart';
import 'package:mvvm_flutter/utils/utils.dart';
import 'package:mvvm_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthVieModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      final userPref = Provider.of<UserViewModel>(context, listen: false);
      userPref.saveUser(UserModel(token: value['token'].toString()));
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage("Login Successfully", context);
        print(value.toString());
        Navigator.pushNamed(context, RoutesNames.home);
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> singUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.signUpApi(data).then((value){
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage("SingUp Successfully", context);
        print(value.toString());
        Navigator.pushNamed(context, RoutesNames.login);
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
