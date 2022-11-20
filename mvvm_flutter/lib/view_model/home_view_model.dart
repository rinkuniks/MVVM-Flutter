import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/data/response/api_response.dart';
import 'package:mvvm_flutter/repository/home_repository.dart';

import '../model/movies_model.dart';

class HomeViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();
  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async{
    _myRepo.moviesListApi().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}