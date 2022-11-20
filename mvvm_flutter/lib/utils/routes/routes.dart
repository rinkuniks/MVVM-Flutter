import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_names.dart';
import 'package:mvvm_flutter/view/home_screen.dart';
import 'package:mvvm_flutter/view/login_view.dart';
import 'package:mvvm_flutter/view/signUp_view.dart';
import 'package:mvvm_flutter/view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesNames.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
