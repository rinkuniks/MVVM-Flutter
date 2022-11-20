import 'package:mvvm_flutter/data/network/BaseApiServices.dart';
import 'package:mvvm_flutter/data/network/NetworkApiServices.dart';
import 'package:mvvm_flutter/res/app_urls.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}
