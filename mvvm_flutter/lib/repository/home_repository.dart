import 'package:mvvm_flutter/model/movies_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_urls.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesListModel> moviesListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrls.moviesList);
      return response = MoviesListModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}